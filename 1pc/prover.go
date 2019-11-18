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
	// debug usage
	delta int
}

type history struct {
	delta   int
	tid     int
	success bool
}

var (
	historysMu sync.Mutex
	// deltas
	historys            map[int][]history
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
	historys = make(map[int][]history)
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
	log.Printf("uid %d after apply tid %d num %d\n", uid, e.write_intent.tid, e.num)
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
		log.Printf("uid %d is clean", uid)
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
			if !ok || anotherEntry.write_intent == nil || anotherEntry.write_intent.tid != tid {
				// the transaction is failed.
				aborted = true
				tr.status = ABORTED
				break
			}
		}
		if !aborted {
			tr.status = COMMITTED
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

func resolveAndPropose(uid int, write_intent *WriteIntent) (conflicted bool) {
	entrymu[uid].Lock()
	mu.Lock()
	e, ok := store[uid]
	if !ok {
		e = &Entry{num: 0, write_intent: write_intent}
		store[uid] = e
		mu.Unlock()
		entrymu[uid].Unlock()
		return false
	}
	mu.Unlock()
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
		log.Printf("set transaction tid %d record ABORT\n", tid)
		transactionsMu.Unlock()
		entrymu[uid].Lock()
		swapped := atomic.CompareAndSwapPointer((*unsafe.Pointer)(unsafe.Pointer(&e.write_intent)), unsafe.Pointer(old_write_intent), unsafe.Pointer(write_intent))
		entrymu[uid].Unlock()
		log.Printf("swap uid %d from tid %d to tid %d %t", uid, old_write_intent.tid, write_intent.tid, swapped)
		return !swapped
	}
	transactionsMu.Unlock()

	s := atomic.LoadInt32(&tr.status)
	log.Printf("transaction %d is %d\n", tid, s)
	switch s {
	case STAGING:
		for _, key := range tr.participantList {
			entrymu[key].Lock()
			mu.Lock()
			anotherEntry, ok := store[key]
			log.Printf("uid %d in tid %d check is %v\n", key, tid, anotherEntry)
			if !ok {
				anotherEntry = &Entry{num: 0}
				store[key] = anotherEntry
			}
			mu.Unlock()
			if anotherEntry.write_intent == nil {
				log.Printf("set nil write_intent uid %d to tid -1\n", uid)
				// try to insert this into store to make possible running transaction failed.
				anotherEntry.write_intent = &WriteIntent{tid: notPossibleTID}
				entrymu[key].Unlock()
				atomic.CompareAndSwapInt32(&tr.status, STAGING, ABORTED)
				return true
			}
			log.Printf("uid %d in tid %d check write_intent is tid %d\n", key, tid, anotherEntry.write_intent.tid)
			if anotherEntry.write_intent.tid != tid {
				entrymu[key].Unlock()
				atomic.CompareAndSwapInt32(&tr.status, STAGING, ABORTED)
				return true
			}
			entrymu[key].Unlock()
		}
		// all keys are ready, commit.
		if atomic.CompareAndSwapInt32(&tr.status, STAGING, COMMITTED) {
			entrymu[uid].Lock()
			log.Printf("STAGING prepare to apply %d in tid %d status %d\n", uid, tid, s)
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
		if e.write_intent.tid != tid {
			log.Printf("tid %d COMMITED but key %d is in tid %d\n", tid, uid, e.write_intent.tid)
			entrymu[uid].Unlock()
			return true
		}
		log.Printf("COMMITTED prepare to apply %d in tid %d status %d\n", uid, e.write_intent.tid, s)
		if applyLocked(uid, e) {
			mu.Lock()
			store[uid] = &Entry{num: 0, write_intent: write_intent}
			mu.Unlock()
		} else {
			e.write_intent = write_intent
		}
		entrymu[uid].Unlock()
		// don't delete transaction record for debug usage
		return false
	case ABORTED:
		entrymu[uid].Lock()
		log.Printf("check uid %d when tid %d in tid %d is ABORTED", uid, write_intent.tid, tid)
		swapped := atomic.CompareAndSwapPointer((*unsafe.Pointer)(unsafe.Pointer(&e.write_intent)), unsafe.Pointer(old_write_intent), unsafe.Pointer(write_intent))
		log.Printf("uid %d in tid %d ABORTED cas to tid %d %t", uid, tid, write_intent.tid, swapped)
		entrymu[uid].Unlock()
		return !swapped
	}
	panic("unreachable")
}

func begin(uid int, tid int, delta int) bool {
	// inject random failure
	if rand.Intn(100) < failureRate {
		log.Printf("tid %d user %d failed", tid, uid)
		// return conflicted to indicate this transaction is failed
		return true
	}
	return resolveAndPropose(uid, &WriteIntent{tid: int(tid), delta: delta})
}

func transfer(from, to int) bool {
	// 1 - 10
	randomDelta := rand.Intn(10) + 1

	tid := int(atomic.AddInt64(&globalTransactionID, 1))
	fromconflict, toconflict := begin(from, tid, randomDelta), begin(to, tid, -randomDelta)

	tidconflicted := false
	transactionsMu.Lock()
	if _, ok := transactions[tid]; ok {
		tidconflicted = true
		log.Printf("set transaction tid %d record conflicted\n", tid)
	} else {
		transactions[tid] = &transactionRecord{delta: randomDelta, status: STAGING, participantList: []int{from, to}}
		log.Printf("set transaction tid %d record to %v\n", tid, transactions[tid])
	}
	transactionsMu.Unlock()

	conflicted := fromconflict || toconflict || tidconflicted
	log.Printf("tid %d fromconflict %t toconflict %t tidconflicted %t", tid, fromconflict, toconflict, tidconflicted)
	historysMu.Lock()
	historys[from] = append(historys[from], history{delta: randomDelta, tid: tid, success: !conflicted})
	historys[to] = append(historys[to], history{delta: -randomDelta, tid: tid, success: !conflicted})
	historysMu.Unlock()
	if !conflicted {
		log.Printf("tid %d transfer from %d to %d delta %d\n", tid, from, to, randomDelta)
	}

	return conflicted
}

func randomTransfer(id int, globalTransferTimes *int64, globalConflictTimes *int64) {
	defer wg.Done()
	t := time.NewTimer(time.Second * time.Duration(seconds))
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
		if start == end {
			continue
		}
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
		origin := numPerUID
		for _, history := range historys[i] {
			if history.success {
				origin -= history.delta
			}
		}
		if e, ok := store[i]; ok {
			if e.write_intent != nil {
				panic(fmt.Sprintf("uid %d write_intent is not null after resolve, write_intent %v", i, e.write_intent))
			}
			if origin != e.num {
				log.Printf("uid %d replay history failed origin %d actual %d historys %v", i, origin, e.num, historys[i])
			}
			actual += e.num
			log.Printf("uid %d num %d\n", i, e.num)
		} else {
			if origin != 0 {
				log.Printf("uid %d replay history failed origin %d actual %d historys %v", i, origin, 0, historys[i])
				log.Printf("uid %d num %d\n", i, 0)
			}
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

func printAllTxn() {
	for tid, txn := range transactions {
		if len(txn.participantList) != 2 {
			log.Printf("transaction tid %d status %d\n", tid, txn.status)
			continue
		}
		log.Printf("transaction tid %d from %d to %d delta %d status %d\n", tid, txn.participantList[0], txn.participantList[1], txn.delta, txn.status)
	}
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
	log.Printf("run transfers %d times conflict %d times\n", globalTransferTimes, globalConflictTimes)
	printAllTxn()
	checkNumSum(minUID, maxUID, numPerUID)
	log.Printf("check success\n")
}
