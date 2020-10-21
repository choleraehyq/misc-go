package main

import (
	"fmt"
	"sync"
	"testing"
)

var batchSize = [...]int{1, 5, 10, 50, 100}

type request struct {
	wg *sync.WaitGroup
}

func BenchmarkAsync(b *testing.B) {
	for _, size := range batchSize {
		ch := make(chan request, size)
		var other sync.WaitGroup
		other.Add(1)
		go func() {
			for r := range ch {
				r.wg.Done()
			}
			other.Done()
		}()
		b.ResetTimer()
		b.Run(fmt.Sprintf("async-%d", size), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				var wg sync.WaitGroup
				wg.Add(size)
				for j := 0; j < size; j++ {
					ch <- request{wg: &wg}
				}
				wg.Wait()
			}
		})
		close(ch)
		other.Wait()
	}
}

func BenchmarkGoroutine(b *testing.B) {
	for _, size := range batchSize {
		ch := make(chan request, size)
		var other sync.WaitGroup
		other.Add(1)
		go func() {
			for r := range ch {
				r.wg.Done()
			}
			other.Done()
		}()
		b.ResetTimer()
		b.Run(fmt.Sprintf("goroutine-%d", size), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				var wg sync.WaitGroup
				wg.Add(size)
				for j := 0; j < size; j++ {
					go func() {
						ch <- request{wg: &wg}
					}()
				}
				wg.Wait()
			}
		})
		close(ch)
		other.Wait()
	}
}
