package bench

import (
	"bytes"
	"strings"
	"testing"
)

type S struct {
	length [5]uint32
	buffer [50]byte
	value  [5]uint32
}

func (this *S) find(s []byte) uint32 {
	start := uint32(0)
	l := uint32(len(s))
	for i := 0; i < len(this.length); i++ {
		// fmt.Printf("index %d length %d, start %d, end %d\n", i, this.length[i], start, start+l-1)
		if this.length[i] == l {
			if bytes.Equal(this.buffer[start:start+l], s) {
				return this.value[i]
			}
		}
		start += this.length[i]
	}
	return 1
}

func BenchmarkMapRead(b *testing.B) {
	m := make(map[string]uint32)
	m[strings.Repeat("a", 5)] = 0
	m[strings.Repeat("a", 30)] = 0
	m[strings.Repeat("a", 6)] = 0
	m[strings.Repeat("a", 3)] = 0
	m[strings.Repeat("b", 6)] = 0
	key := "aaa"
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if m[key] != 0 {
			b.FailNow()
		}
	}
}

func BenchmarkMapInt32KeyRead(b *testing.B) {
	var s = S{
		length: [5]uint32{5, 30, 6, 3, 6},
	}
	for i := 0; i < len(s.buffer); i++ {
		s.buffer[i] = 'a'
	}
	a := []byte{'a', 'a', 'a'}
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		if s.find(a) != 0 {
			b.FailNow()
		}
	}
}
