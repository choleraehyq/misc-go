package bench

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
