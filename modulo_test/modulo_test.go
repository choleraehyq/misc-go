package main

import "testing"

func BenchmarkModulo(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = i % 12345
	}
}

func BenchmarkBitAnd(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = i & (12345 - 1)
	}
}
