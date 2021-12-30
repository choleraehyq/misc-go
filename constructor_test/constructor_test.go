package main

import (
	"testing"
)

func BenchmarkConstructor(b *testing.B) {
	for i := 0; i < b.N; i++ {
		DoWithNewS()
	}
}

func BenchmarkNoConstructor(b *testing.B) {
	for i := 0; i < b.N; i++ {
		DoWithS()
	}
}
