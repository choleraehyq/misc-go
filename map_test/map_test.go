package bench

import (
	"testing"
)

func BenchmarkMapRead(b *testing.B) {
	m := make(map[int]*int)
	for i := 0; i < b.N; i++ {
		if m[i] != nil {
			b.Fatalf("%d should not be nil", i)
		}
	}
}

func BenchmarkMapInt32KeyRead(b *testing.B) {
	m := make(map[int32]*int)
	for i := 0; i < b.N; i++ {
		if m[int32(i)] != nil {
			b.Fatalf("%d should not be nil", i)
		}
	}
}
