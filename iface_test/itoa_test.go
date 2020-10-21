package bench

import (
	"testing"
)

type adder func(int, int) int

type itest interface {
	adder(int, int) int
}

type test struct {
	adder adder
}

type stest struct{}

func (this *stest) adder(a, b int) int {
	return a + b
}

func fadder(a, b int) int {
	return a + b
}

func BenchmarkItest(b *testing.B) {
	var iface itest = &stest{}
	for i := 0; i < b.N; i++ {
		iface.adder(i, i)
	}
}

func BenchmarkFtest(b *testing.B) {
	t := &test{}
	t.adder = fadder
	for i := 0; i < b.N; i++ {
		t.adder(i, i)
	}
}
