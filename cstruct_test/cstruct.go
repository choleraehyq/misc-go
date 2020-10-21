package main

/*
#include <stdlib.h>
#include <string>
struct B {
	int i;
};

struct A {
	int j;
	std::string s;
	struct B b;
};

typedef struct A SA;

SA *m() {
  return malloc(sizeof(SA));
}
*/
import "C"
import (
	"runtime"
	"unsafe"
)

func NewA() *C.struct_A {
	return &C.struct_A{
		j: 1,
		b: C.struct_B{
			i: 2,
		},
	}
}

func NewAMalloc() *C.struct_A {
	return (*C.struct_A)(C.m())
}

var _ = unsafe.Sizeof(0)

//go:noescape
//go:linkname GoMemmove runtime.memmove
func GoMemmove(to, from unsafe.Pointer, n uintptr)

func main() {
	for {
		for i := 0; i < 100000; i++ {
			a := NewA()
			am := NewAMalloc()
			GoMemmove(unsafe.Pointer(a), unsafe.Pointer(am), unsafe.Sizeof(C.struct_A{}))
			C.free(unsafe.Pointer(am))
		}
		runtime.GC()
		println("ok")
	}
}
