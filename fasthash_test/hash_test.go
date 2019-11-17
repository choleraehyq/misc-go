package bench

import (
	"crypto/rand"
	"runtime"
	"strings"
	"sync"
	"testing"

	"github.com/cespare/xxhash"
)

var (
	buf64  []byte = make([]byte, 64)
	buf128 []byte = make([]byte, 128)
	buf256 []byte = make([]byte, 256)
	result uint64
)

func init() {
	rand.Read(buf64)
	rand.Read(buf128)
	rand.Read(buf256)
}

func BenchmarkStringHash64(b *testing.B) {
	s := strings.Repeat("foobar12", 8)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		result = StringHash(s)
	}
}

func BenchmarkXXHashString64(b *testing.B) {
	s := strings.Repeat("foobar12", 8)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		result = xxhash.Sum64String(s)
	}
}

func BenchmarkMemHash64(b *testing.B) {
	for i := 0; i < b.N; i++ {
		result = MemHash(buf64)
	}
}

func BenchmarkMemHash128(b *testing.B) {
	for i := 0; i < b.N; i++ {
		result = MemHash(buf128)
	}
}

func BenchmarkMemHash256(b *testing.B) {
	for i := 0; i < b.N; i++ {
		result = MemHash(buf256)
	}
}

func BenchmarkXXHash64(b *testing.B) {
	for i := 0; i < b.N; i++ {
		result = xxhash.Sum64(buf64)
	}
}

func BenchmarkXXHash128(b *testing.B) {
	for i := 0; i < b.N; i++ {
		result = xxhash.Sum64(buf128)
	}
}

func BenchmarkXXHash256(b *testing.B) {
	for i := 0; i < b.N; i++ {
		result = xxhash.Sum64(buf256)
	}
}

func TestMemHashInMultiGoroutines(t *testing.T) {
	h := MemHash(buf64)
	var wg sync.WaitGroup
	gnum := 1000
	iternum := 100000
	wg.Add(1000)
	for i := 0; i < gnum; i++ {
		go func() {
			defer wg.Done()
			for i := 0; i < iternum; i++ {
				localh := MemHash(buf64)
				if localh != h {
					t.Fatalf("diff! h %d vs localh %d", h, localh)
				}
				runtime.Gosched()
			}
		}()
	}
}
