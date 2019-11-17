package main

import (
	"sync"
	"testing"
)

var intpool = &sync.Pool{New: func() interface{} { return new(int) }}
var i *int

func BenchmarkPool(b *testing.B) {
	b.RunParallel(func(pb *testing.PB) {
		for pb.Next() {
			a := intpool.Get().(*int)
			(*a)++
      i = a
			intpool.Put(a)
		}
	})
}
func BenchmarkPool5(b *testing.B) {
	b.SetParallelism(5)
	b.RunParallel(func(pb *testing.PB) {
		for pb.Next() {
			a := intpool.Get().(*int)
			(*a)++
      i = a
			intpool.Put(a)
		}
	})
}
func BenchmarkPool10(b *testing.B) {
	b.SetParallelism(10)
	b.RunParallel(func(pb *testing.PB) {
		for pb.Next() {
			a := intpool.Get().(*int)
			(*a)++
      i = a
			intpool.Put(a)
		}
	})
}
func BenchmarkAlloc(b *testing.B) {
	b.RunParallel(func(pb *testing.PB) {
		for pb.Next() {
			a := new(int)
			(*a)++
      i = a
		}
	})
}
func BenchmarkAlloc5(b *testing.B) {
	b.SetParallelism(5)
	b.RunParallel(func(pb *testing.PB) {
		for pb.Next() {
			a := new(int)
			(*a)++
      i = a
		}
	})
}
func BenchmarkAlloc10(b *testing.B) {
	b.SetParallelism(10)
	b.RunParallel(func(pb *testing.PB) {
		for pb.Next() {
			a := new(int)
			(*a)++
      i = a
		}
	})
}
