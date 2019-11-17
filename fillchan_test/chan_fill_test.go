package main

import (
	"testing"
)

func fill(x int) {
	ch := make(chan int, x)
	for j := 0; j < x; j++ {
		ch <- j
	}
}

func BenchmarkFillChan1000(b *testing.B) {
	for i := 0; i < b.N; i++ {
		fill(1000)
	}
}

func BenchmarkFillChan100(b *testing.B) {
	for i := 0; i < b.N; i++ {
		fill(100)
	}
}

func BenchmarkFillChan10(b *testing.B) {
	for i := 0; i < b.N; i++ {
		fill(10)
	}
}
