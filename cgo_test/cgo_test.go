package main

import "testing"

func Benchmark_Go_Call_C(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Call()
	}
}

func BenchmarkGoAdd(b *testing.B) {
	s := 0
	for i := 0; i < b.N; i++ {
		s = GoAdd(s)
	}
}

func BenchmarkCGoAdd(b *testing.B) {
	s := 0
	for i := 0; i < b.N; i++ {
		s = CAdd(s)
	}
}
