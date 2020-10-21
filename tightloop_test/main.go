package main

import (
	"runtime"
	"time"
)

func main() {
	runtime.GOMAXPROCS(1)
	go func() {
		for {
		}
	}()
	for {
		time.Sleep(time.Millisecond)
		println("OK")
	}
}
