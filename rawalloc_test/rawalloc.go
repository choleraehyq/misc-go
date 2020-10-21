package bench

// #include <stdlib.h>
import "C"

import "unsafe"

const (
	maxArrayLen = 1<<50 - 1
)

// The go:linkname directives provides backdoor access to private functions in
// the runtime. Below we're accessing the mallocgc function. Note that this
// access is necessarily tied to a specific Go release which is why this file
// is protected by a build tag.

//go:linkname mallocgc runtime.mallocgc
func mallocgc(size uintptr, typ unsafe.Pointer, needzero bool) unsafe.Pointer

func Rawalloc(len, cap int) []byte {
	ptr := mallocgc(uintptr(cap), nil, false)
	return (*[maxArrayLen]byte)(ptr)[:len:cap]
}

func ManualAlloc(n int) []byte {
	if n == 0 {
		return make([]byte, 0)
	}
	// We need to be conscious of the Cgo pointer passing rules:
	//
	//   https://golang.org/cmd/cgo/#hdr-Passing_pointers
	//
	//   ...
	//   Note: the current implementation has a bug. While Go code is permitted
	//   to write nil or a C pointer (but not a Go pointer) to C memory, the
	//   current implementation may sometimes cause a runtime error if the
	//   contents of the C memory appear to be a Go pointer. Therefore, avoid
	//   passing uninitialized C memory to Go code if the Go code is going to
	//   store pointer values in it. Zero out the memory in C before passing it
	//   to Go.
	ptr := C.calloc(C.size_t(n), 1)
	if ptr == nil {
		panic("out of memory")
	}
	// Interpret the C pointer as a pointer to a Go array, then slice.
	return (*[maxArrayLen]byte)(unsafe.Pointer(ptr))[:n:n]
}

// Free frees the specified slice.
func Free(b []byte) {
	if cap(b) != 0 {
		if len(b) == 0 {
			b = b[:cap(b)]
		}
		ptr := unsafe.Pointer(&b[0])
		C.free(ptr)
	}
}
