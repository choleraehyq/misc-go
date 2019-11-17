package main

import "testing"
import "sync/atomic"

type A struct {
	a *int
	s string
}

type ComplexStruct struct {
	i int64
	s string
	a A
	b *A
}

func BenchmarkClosureCost(b *testing.B) {
	var s ComplexStruct
	for i := 0; i < b.N; i++ {
		f := func() {
			atomic.AddInt64(&s.i, 1)
		}
		f()
	}
	println(s.i)
}
