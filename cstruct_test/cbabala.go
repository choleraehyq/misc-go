paaackage main

/*
struct B {
  int i;
};

typedef struct A {
  int j;
  struct B b;
} A_t;


void f(A_t *p) {
	(void *)p;
}

void fc(char **p) {
	(void *)p;
}
*/
import "C"

import (
	"runtime"
	"unsafe"
)

//go:nosplit
func noescape(p unsafe.Pointer) unsafe.Pointer {
	x := uintptr(p)
	return unsafe.Pointer(x ^ 0) //nolint:staticcheck
}

func main() {
	a := C.A_t{}
	C.f((*C.A_t)(noescape(unsafe.Pointer(&a))))
	runtime.KeepAlive(a)
	var p *C.char
	C.fc(&p)
	runtime.KeepAlive(p)
}
