package main

import (
	"math/bits"
	"testing"
)

var a int
var c int

func BenchmarkCtzZero(b *testing.B) {
	for i := 0; i < b.N; i++ {
		a = bits.TrailingZeros64(0)
		if a == 64 {
			c++
		}
	}
}

func BenchmarkIfZero(b *testing.B) {
	a = 1
	for i := 0; i < b.N; i++ {
		if a == 0 {
			c++
			continue
		}
		a += 2
	}
}
