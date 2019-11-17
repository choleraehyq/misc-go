package main

import "testing"

func BenchmarkCStruct(b *testing.B) {
	for i := 0; i < b.N; i++ {
		a := NewA()
		_ = a
	}
}
