package main

import (
	"sync/atomic"
	"testing"
)

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

func BuildClosure() func() {
	var i int64
	return func() {
		atomic.AddInt64(&i, 1)
	}
}

func F() {
	var i int64
	atomic.AddInt64(&i, 1)
}

var i int64

func F2() {
	atomic.AddInt64(&i, 1)
}

func BenchmarkClosureCost(b *testing.B) {
	f := BuildClosure()
	for i := 0; i < b.N; i++ {
		f()
	}
}

func BenchmarkDirectFuncCost(b *testing.B) {
	for i := 0; i < b.N; i++ {
		F()
	}
}

func BenchmarkDirectFuncCost2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		F2()
	}
}
