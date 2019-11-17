package main

import (
	"sync/atomic"
	"testing"
)

var (
	i32 int32
	i64 int64
)

func BenchmarkI32(b *testing.B) {
	b.RunParallel(func(pb *testing.PB) {
		for pb.Next() {
			atomic.StoreInt32(&i32, int32(123))
			_ = atomic.LoadInt32(&i32)
		}
	})
}

func BenchmarkI64(b *testing.B) {
	b.RunParallel(func(pb *testing.PB) {
		for pb.Next() {
			atomic.StoreInt64(&i64, int64(456))
			_ = atomic.LoadInt64(&i64)
		}
	})
}

func BenchmarkAddI32(b *testing.B) {
	b.RunParallel(func(pb *testing.PB) {
		for pb.Next() {
			atomic.AddInt32(&i32, 1)
		}
	})
}

func BenchmarkAddI64(b *testing.B) {
	b.RunParallel(func(pb *testing.PB) {
		for pb.Next() {
			atomic.AddInt64(&i64, 1)
		}
	})
}
