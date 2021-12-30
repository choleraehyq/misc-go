package main

import (
	"sync"
	"sync/atomic"
	"testing"
)

var intpool = &sync.Pool{New: func() interface{} { return new(int) }}
var i *int64 = new(int64)

func BenchmarkPool(b *testing.B) {
	b.RunParallel(func(pb *testing.PB) {
		for pb.Next() {
			a := intpool.Get().(*int)
			_ = a
			intpool.Put(a)
		}
	})
}
func BenchmarkPool5(b *testing.B) {
	b.SetParallelism(5)
	b.RunParallel(func(pb *testing.PB) {
		for pb.Next() {
			a := intpool.Get().(*int)
			_ = a
			intpool.Put(a)
		}
	})
}
func BenchmarkPool10(b *testing.B) {
	b.SetParallelism(10)
	b.RunParallel(func(pb *testing.PB) {
		for pb.Next() {
			a := intpool.Get().(*int)
			_ = a
			intpool.Put(a)
		}
	})
}
func BenchmarkAlloc(b *testing.B) {
	b.RunParallel(func(pb *testing.PB) {
		var a *int
		for pb.Next() {
			a = new(int)
		}
		if a != nil {
			atomic.StoreInt64(i, int64(*a))
		}
	})
}
func BenchmarkAlloc5(b *testing.B) {
	b.SetParallelism(5)
	b.RunParallel(func(pb *testing.PB) {
		var a *int
		for pb.Next() {
			a = new(int)
		}
		if a != nil {
			atomic.StoreInt64(i, int64(*a))
		}
	})
}
func BenchmarkAlloc10(b *testing.B) {
	b.SetParallelism(10)
	b.RunParallel(func(pb *testing.PB) {
		var a *int
		for pb.Next() {
			a = new(int)
		}
		if a != nil {
			atomic.StoreInt64(i, int64(*a))
		}
	})
}
