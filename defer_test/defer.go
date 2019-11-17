package main

import (
	"sync"
)

var mmu sync.Mutex

func deferUnlock() {
	mmu.Lock()
	defer mmu.Unlock()
}

func main() {
	deferUnlock()
}
