package main

import "testing"

func Benchmark_Go_Call_C(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Call()
	}
}
