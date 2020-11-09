package bench

import (
	"fmt"
	"runtime"
	"testing"
)

var sizes = [...]int{
	1024, 2 * 1024, 4 * 1024, 8 * 1024,
}

func BenchmarkMake(b *testing.B) {
	for _, size := range sizes {
		b.Run(fmt.Sprintf("Make-%d", size), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				s2 := make([]byte, size)
				_ = s2
			}
		})
	}
	runtime.GC()
}

func BenchmarkRawallocAndCopy(b *testing.B) {
	for _, size := range sizes {
		b.Run(fmt.Sprintf("Rawalloc-%d", size), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				s2 := Rawalloc(size, size)
				_ = s2
			}
		})
	}
	runtime.GC()
}

func BenchmarkManualAlloc(b *testing.B) {
	for _, size := range sizes {
		b.Run(fmt.Sprintf("Jemalloc-%d", size), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				s2 := ManualAlloc(size)
				Free(s2)
			}
		})
	}
}
