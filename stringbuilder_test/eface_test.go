package main

import (
	"strings"
	"sync"
	"testing"
)

var p = &sync.Pool{
	New: func() interface{} {
		return &strings.Builder{}
	},
}

var globalS string

func BenchmarkBuilderPool(b *testing.B) {
	for i := 0; i < b.N; i++ {
		s := p.Get().(*strings.Builder)
		s.Reset()
		s.WriteString("abc")
		globalS = s.String()
		p.Put(s)
	}
}

func BenchmarkBuilderStack(b *testing.B) {
	for i := 0; i < b.N; i++ {
		var b strings.Builder
		b.WriteString("abc")
		globalS = b.String()
	}
}
