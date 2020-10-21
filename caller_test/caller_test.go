package main

import (
	"runtime"
	"testing"
)

func BenchmarkCaller(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_, file, line, _ := runtime.Caller(0)
		_, _ = file, line
	}
}
