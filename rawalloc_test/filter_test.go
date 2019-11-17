package bench

import (
	"bytes"
	"testing"
)

func BenchmarkMakeAndCopy(b *testing.B) {
	s := bytes.Repeat([]byte("foo"), 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		s2 := make([]byte, len(s))
		copy(s2, s)
	}
}

func BenchmarkRawallocAndCopy(b *testing.B) {
	s := bytes.Repeat([]byte("foo"), 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		s2 := Rawalloc(len(s), len(s))
		copy(s2, s)
	}
}
