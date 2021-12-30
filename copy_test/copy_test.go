package bench

import (
	"bytes"
	"testing"
)

func BenchmarkCopyMakeAndCopy(b *testing.B) {
	s := bytes.Repeat([]byte("foo"), 4096)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		s2 := make([]byte, 0, len(s))
		s2 = append(s2, s...)
	}
}

func BenchmarkCopyAppendToNil(b *testing.B) {
	s := bytes.Repeat([]byte("foo"), 4096)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		s2 := append(s[:0:0], s...)
		_ = s2
	}
}
