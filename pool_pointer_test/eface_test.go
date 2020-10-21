package main

import (
	"sync"
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

var p sync.Pool = sync.Pool{
	New: func() interface{} {
		s := make([]int, 10)
		return &s
	},
}

func BenchmarkPointerPool(b *testing.B) {
	for i := 0; i < b.N; i++ {
		s := p.Get().(*[]int)
		s2 := *s
		_ = s2
		p.Put(s)
	}
}

var p2 sync.Pool = sync.Pool{
	New: func() interface{} {
		return make([]int, 10)
	},
}

func BenchmarkSlicePool(b *testing.B) {
	for i := 0; i < b.N; i++ {
		s := p2.Get().([]int)
		p2.Put(s)
	}
}
