package main

import (
	"fmt"
	"reflect"
	"testing"
	"unsafe"
)

var length = [...]int64{10, 100, 1000, 1000 * 100, 1024 * 1024}
var globalb []byte

func BenchmarkMemclr(b *testing.B) {
	for _, l := range length {
		bb := make([]byte, l)
		for i := 0; i < len(bb); i++ {
			bb[i] = 1
		}
		b.Run(fmt.Sprintf("memclr-%d", l), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				header := (*reflect.SliceHeader)(unsafe.Pointer(&bb))
				memclrNoHeapPointers(unsafe.Pointer(header.Data), uintptr(l))
			}
			globalb = bb
		})
		for i := 0; i < len(bb); i++ {
			if bb[i] != 0 {
				b.Fatalf("bb is not cleared! i %d\n", i)
			}
		}
		for i := 0; i < len(bb); i++ {
			bb[i] = 1
		}
		b.Run(fmt.Sprintf("loopReset-%d", l), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				for j := 0; j < len(bb); j++ {
					bb[j] = 0
				}
			}
			globalb = bb
		})
		for i := 0; i < len(bb); i++ {
			if bb[i] != 0 {
				b.Fatalf("bb is not cleared! i %d\n", i)
			}
		}
	}
}
