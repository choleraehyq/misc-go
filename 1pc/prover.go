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
	"unsafe"
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
	globalTransferTimes int64
	globalConflictTimes int64
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

func applyLocked(uid int, e *Entry) (deleted bool) {
	// may be applied by another concurrent transaction
	if e.write_intent == nil {
		return false
	}
	e.num -= e.write_intent.delta
	log.Printf("uid %d after apply %d\n", uid, e.num)
	e.write_intent = nil
	if e.num == 0 {
		mu.Lock()
		delete(store, uid)
		mu.Unlock()
		return true
	}
	return false
}

// clean write_intent when the world stops.
// so no need to use any locks.
func resolveWhenSTW(uid int) {
	e, ok := store[uid]
	if !ok || e.write_intent == nil {
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
		aborted := false
		for _, id := range tr.participantList {
			anotherEntry, ok := store[id]
			if !ok || anotherEntry.write_intent == nil {
				// the transaction is failed.
				aborted = true
				tr.status = ABORTED
				break
			}
		}
		if !aborted {
			applyLocked(uid, e)
		} else {
			e.write_intent = nil
		}
	case COMMITTED:
		applyLocked(uid, e)
	case ABORTED:
		e.write_intent = nil
	}
}

func resolveAndPropose(uid int, e *Entry, write_intent *WriteIntent) (conflicted bool) {
	entrymu[uid].Lock()
	old_write_intent := e.write_intent
	if e.write_intent == nil {
		e.write_intent = write_intent
		entrymu[uid].Unlock()
		return false
	}
	tid := e.write_intent.tid
	entrymu[uid].Unlock()
	transactionsMu.Lock()
	tr, ok := transactions[tid]
	log.Printf("tid %d tr %p\n", tid, tr)
	if !ok {
		// aborted transaction.
		// insert an aborted transaction record to break possible running transaction failed.
		transactions[tid] = &transactionRecord{
			status: ABORTED,
		}
		log.Printf("set transaction tid %d record to %v\n", tid, transactions[tid])
	}
	transactionsMu.Unlock()
	if !ok {
		entrymu[uid].Lock()
		swapped := atomic.CompareAndSwapPointer((*unsafe.Pointer)(unsafe.Pointer(&e.write_intent)), unsafe.Pointer(old_write_intent), unsafe.Pointer(write_intent))
		entrymu[uid].Unlock()
		return swapped
	}

	s := atomic.LoadInt32(&tr.status)
	log.Printf("transaction %d is %d\n", tid, s)
	switch s {
	case STAGING:
		for _, key := range tr.participantList {
			mu.Lock()
			entrymu[key].Lock()
			anotherEntry, ok := store[key]
			if !ok {
				anotherEntry = &Entry{num: 0}
				store[key] = anotherEntry
			}
			entrymu[key].Unlock()
			mu.Unlock()
			entrymu[key].Lock()
			if anotherEntry.write_intent == nil {
				// try to insert this into store to make possible running transaction failed.
				anotherEntry.write_intent = &WriteIntent{tid: notPossibleTID}
				entrymu[key].Unlock()
				return true
			}
			entrymu[key].Unlock()
		}
		// all keys are ready, commit.
		if atomic.CompareAndSwapInt32(&tr.status, STAGING, COMMITTED) {
			entrymu[uid].Lock()
			log.Printf("STAGING prepare to apply %d in transaction id %d status %d\n", uid, tid, s)
			if applyLocked(uid, e) {
				mu.Lock()
				store[uid] = &Entry{num: 0, write_intent: write_intent}
				mu.Unlock()
			} else {
				e.write_intent = write_intent
			}
			entrymu[uid].Unlock()
			return false
		}
		return true
	case COMMITTED:
		entrymu[uid].Lock()
		log.Printf("COMMITTED prepare to apply %d in transaction id %d status %d\n", uid, tid, s)
		if applyLocked(uid, e) {
			mu.Lock()
			store[uid] = &Entry{num: 0, write_intent: write_intent}
			mu.Unlock()
		} else {
			e.write_intent = write_intent
		}
		entrymu[uid].Unlock()
		// check whether we are the last write_intent.
		for _, key := range tr.participantList {
			mu.Lock()
			anotherEntry, ok := store[key]
			mu.Unlock()
			entrymu[key].Lock()
			if ok && anotherEntry.write_intent != nil && anotherEntry.write_intent.tid == tid {
				entrymu[key].Unlock()
				return false
			}
			entrymu[key].Unlock()
		}
		// we are the last write_intent in this transaction
		transactionsMu.Lock()
		log.Printf("deleting tid %d\n", tid)
		delete(transactions, tid)
		transactionsMu.Unlock()
		return false
	case ABORTED:
		e.write_intent = nil
		return false
	}
	panic("unreachable")
}

func begin(uid int, tid int, delta int) bool {
	// inject random failure
	if rand.Intn(100) < failureRate {
		return false
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
			fuser = store[uid]
		}
		mu.Unlock()
	}
	entrymu[uid].Unlock()
	if !flag {
		return resolveAndPropose(uid, fuser, &WriteIntent{tid: int(tid), delta: delta})
	}
	return false
}

func transfer(from, to int) bool {
	// 1 - 10
	randomDelta := rand.Intn(10) + 1

	tid := int(atomic.AddInt64(&globalTransactionID, 1))
	conflicted := begin(from, tid, randomDelta) || begin(to, tid, -randomDelta)

	transactionsMu.Lock()
	transactions[tid] = &transactionRecord{status: STAGING, participantList: []int{from, to}}
	log.Printf("set transaction tid %d record to %v\n", tid, transactions[tid])
	transactionsMu.Unlock()
	if !conflicted {
		log.Printf("transfer from %d to %d delta %d\n", from, to, randomDelta)
	}
	return conflicted
}

func randomTransfer(id int, globalTransferTimes *int64, globalConflictTimes *int64) {
	defer wg.Done()
	t := time.NewTimer(time.Second * 10)
	var localConflictNum, localTransferNum int64
	for {
		select {
		case <-t.C:
			log.Printf("%d run transfer %d times\n", id, localTransferNum)
			atomic.AddInt64(globalTransferTimes, localTransferNum)
			atomic.AddInt64(globalConflictTimes, localConflictNum)
			return
		default:
		}
		start := rand.Intn(maxUID-minUID) + minUID
		end := rand.Intn(maxUID-minUID) + minUID
		if transfer(start, end) {
			localConflictNum++
		}
		localTransferNum++
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
			log.Printf("uid %d num %d\n", i, e.num)
		} else {
			log.Printf("uid %d num %d\n", i, 0)
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
		go randomTransfer(i, &globalTransferTimes, &globalConflictTimes)
	}
	wg.Wait()
	checkNumSum(minUID, maxUID, numPerUID)
	log.Printf("run transfers %d times check success\n", globalTransferTimes)
}
