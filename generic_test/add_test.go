package main

import (
	"testing"
)

var a int

func BenchmarkAddGeneric(b *testing.B) {
	for i := 0; i < b.N; i++ {
		a = add(i, i)
	}
}

func BenchmarkAdd(b *testing.B) {
	for i := 0; i < b.N; i++ {
		a = i + i
	}
}
