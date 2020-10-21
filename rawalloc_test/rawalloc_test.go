package bench

import (
	"bytes"
	"runtime"
	"testing"
)

func BenchmarkMakeAndCopy(b *testing.B) {
	s := bytes.Repeat([]byte("foo"), 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		s2 := make([]byte, len(s))
		_ = s2
	}
	runtime.GC()
}

func BenchmarkRawallocAndCopy(b *testing.B) {
	s := bytes.Repeat([]byte("foo"), 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		s2 := Rawalloc(len(s), len(s))
		_ = s2
	}
	runtime.GC()
}

func BenchmarkManualAlloc(b *testing.B) {
	s := bytes.Repeat([]byte("foo"), 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		s2 := ManualAlloc(len(s))
		Free(s2)
	}
}
