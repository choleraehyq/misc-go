package bench

import (
	"testing"
	"time"
)

func BenchmarkTimeNow(b *testing.B) {
	for i := 0; i < b.N; i++ {
		time.Now()
	}
}

func BenchmarkCputicks(b *testing.B) {
	for i := 0; i < b.N; i++ {
		cputicks()
	}
}
