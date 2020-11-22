package main

import (
	"fmt"
	"testing"
)

type v struct {
	ID   int64
	Type int32
}

var bp *v
var idp *int64

func batchalloc(n int) {
	b := make([]v, n)
	bp = &b[0]
}

func singlealloc(n int) {
	for i := 0; i < n; i++ {
		id := int64(i)
		idp = &id
	}
}

func TestAllocPerRun(t *testing.T) {
	n := 10
	batchallocPerRun := testing.AllocsPerRun(1000, func() {
		batchalloc(n)
	})
	singleallocPerRun := testing.AllocsPerRun(1000, func() {
		singlealloc(n)
	})
	if batchallocPerRun != 1 {
		t.Errorf("batchallocPerRun: %f", batchallocPerRun)
	}
	if int(singleallocPerRun) != n {
		t.Errorf("singleallocPerRun: %f", singleallocPerRun)
	}
}

var counts = [...]int{10, 100, 500, 1000, 2000, 5000}

func BenchmarkBatchAlloc(b *testing.B) {
	for _, count := range counts {
		b.Run(fmt.Sprintf("BenchmarkBatchAlloc-%d", count), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				batchalloc(count)
			}
		})
	}
}

func BenchmarkSingleAlloc(b *testing.B) {
	for _, count := range counts {
		b.Run(fmt.Sprintf("BenchmarkSingleAlloc-%d", count), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				singlealloc(count)
			}
		})
	}
}
