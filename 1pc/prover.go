package main

import (
	"flag"
	"fmt"
	"log"
	"math/rand"
	"net"
	"net/http"
	_ "net/http/pprof"
	"strconv"
	"sync"
	"sync/atomic"
	"time"
)

type WriteIntent struct {
	tid   int
	delta int
}

type Entry struct {
	num          int
	write_intent *WriteIntent
}

const (
	STAGING int32 = iota
	COMMITTED
	ABORTED
)

type transactionRecord struct {
	status          int32
	participantList []int
}

var (
	entrymu             [maxUID - minUID + 1]sync.Mutex
	store               map[int]*Entry
	mu                  sync.Mutex
	transactions        map[int]*transactionRecord
	transactionsMu      sync.Mutex
	globalTransactionID int64
	wg                  sync.WaitGroup
	r                   *rand.Rand
)

// flags
var (
	goroutineNum int
	seconds      int
	failureRate  int
	debugPort    int
)

const (
	minUID = 0
	maxUID = 9999

	numPerUID = 100

	notPossibleTID = -1
)

func initData(minUID, maxUID, numPerUID int) {
	store = make(map[int]*Entry)
	transactions = make(map[int]*transactionRecord)
	for i := minUID; i <= maxUID; i++ {
		store[i] = &Entry{num: numPerUID}
	}
}

func applyLocked(uid int, e *Entry) {
	e.num -= e.write_intent.delta
	e.write_intent = nil
	if e.num == 0 {
		mu.Lock()
		delete(store, uid)
		mu.Unlock()
	}
}

// clean write_intent when the world stops.
// so no need to use any locks.
func resolveWhenSTW(uid int) {
	e, ok := store[uid]
	if e.write_intent == nil {
		return
	}
	tid := e.write_intent.tid
	tr, ok := transactions[tid]
	if !ok {
		e.write_intent = nil
		return
	}
	s := tr.status
	switch s {
	case STAGING:
		for _, id := range tr.participantList {
			anotherEntry := store[id]
			if anotherEntry.write_intent == nil {
				// the transaction is failed.
				tr.status = ABORTED
				break
			}
		}
		e.write_intent = nil
	case COMMITTED:
		applyLocked(uid, e)
	case ABORTED:
		e.write_intent = nil
	}
}

func resolveAndPropose(uid int, e *Entry, write_intent *WriteIntent) (conflicted bool) {
	entrymu[uid].Lock()
	if e.write_intent == nil {
		entrymu[uid].Unlock()
		return false
	}
	tid := e.write_intent.tid
	entrymu[uid].Unlock()
	transactionsMu.Lock()
	tr, ok := transactions[tid]
	transactionsMu.Unlock()
	if !ok {
		// aborted transaction.
		// insert an aborted transaction record to break possible running transaction failed.
		transactionsMu.Lock()
		transactions[tid] = &transactionRecord{
			status: ABORTED,
		}
		transactionsMu.Unlock()
	}

	s := atomic.LoadInt32(&tr.status)
	switch s {
	case STAGING:
		for _, key := range tr.participantList {
			mu.Lock()
			anotherEntry := store[key]
			mu.Unlock()
			entrymu[key].Lock()
			if anotherEntry.write_intent == nil {
				// try to insert this into store to make possible running transaction failed.
				anotherEntry.write_intent = &WriteIntent{tid: notPossibleTID}
				entrymu[key].Unlock()
				return true
			}
		}
		// all keys are ready, commit.
		if atomic.CompareAndSwapInt32(&tr.status, STAGING, COMMITTED) {
			entrymu[uid].Lock()
			applyLocked(uid, e)
			entrymu[uid].Unlock()
			return false
		}
		return true
	case COMMITTED:
		entrymu[uid].Lock()
		applyLocked(uid, e)
		entrymu[uid].Unlock()
		// check whether we are the last write_intent.
		for _, key := range tr.participantList {
			mu.Lock()
			anotherEntry := store[key]
			mu.Unlock()
			entrymu[key].Lock()
			if anotherEntry.write_intent != nil {
				entrymu[key].Unlock()
				return false
			}
			entrymu[key].Unlock()
		}
		// we are the last write_intent in this transaction
		transactionsMu.Lock()
		delete(transactions, tid)
		transactionsMu.Unlock()
		return false
	case ABORTED:
		e.write_intent = nil
		return false
	}
	panic("unreachable")
}

func begin(uid int, tid int, delta int) {
	// inject random failure
	if rand.Intn(100) < failureRate {
		return
	}
	mu.Lock()
	fuser := store[uid]
	mu.Unlock()

	flag := false
	entrymu[uid].Lock()
	if fuser == nil {
		mu.Lock()
		if store[uid] == nil {
			flag = true
			store[uid] = &Entry{num: 0, write_intent: &WriteIntent{tid: int(tid), delta: delta}}
		}
		mu.Unlock()
	}
	entrymu[uid].Unlock()
	if !flag {
		resolveAndPropose(uid, fuser, &WriteIntent{tid: int(tid), delta: delta})
	}
}

func transfer(from, to int) {
	// 1 - 10
	randomDelta := rand.Intn(10) + 1

	tid := int(atomic.AddInt64(&globalTransactionID, 1))
	begin(from, tid, randomDelta)
	begin(to, tid, randomDelta)

	transactionsMu.Lock()
	transactions[tid] = &transactionRecord{status: STAGING, participantList: []int{from, to}}
	transactionsMu.Unlock()
}

func randomTransfer() {
	defer wg.Done()
	t := time.NewTimer(time.Second * 10)
	for {
		select {
		case <-t.C:
			return
		default:
		}
		start := rand.Intn(maxUID-minUID) + minUID
		end := rand.Intn(maxUID-minUID) + minUID
		transfer(start, end)
	}
}

func checkNumSum(minUID, maxUID, numPerUID int) {
	actual := 0
	for i := minUID; i <= maxUID; i++ {
		resolveWhenSTW(i)
		if e, ok := store[i]; ok {
			if e.write_intent != nil {
				panic(fmt.Sprintf("uid %d write_intent is not null after resolve, write_intent %v", i, e.write_intent))
			}
			actual += e.num
		}
	}
	expected := (maxUID - minUID + 1) * numPerUID
	if actual != expected {
		panic(fmt.Sprintf("actual %d, expected %d", actual, expected))
	}
}

func init() {
	flag.IntVar(&goroutineNum, "goroutineNum", 100, "concurrent running goroutine number")
	flag.IntVar(&seconds, "seconds", 10, "random transfer running time")
	flag.IntVar(&failureRate, "failureRate", 0, "random failure rate percentage during transfer")
	flag.IntVar(&debugPort, "debugPort", 6060, "debug pprof port")

	r = rand.New(rand.NewSource(99))
}

func main() {
	flag.Parse()
	go func() {
		log.Println(http.ListenAndServe(net.JoinHostPort("localhost", strconv.Itoa(debugPort)), nil))
	}()
	initData(minUID, maxUID, numPerUID)
	for i := 0; i < goroutineNum; i++ {
		wg.Add(1)
		go randomTransfer()
	}
	wg.Wait()
	checkNumSum(minUID, maxUID, numPerUID)
	log.Println("check success")
}
