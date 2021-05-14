package bench

import (
	"unsafe"
)

var _ = unsafe.Sizeof(0)

// The go:linkname directives provides backdoor access to private functions in
// the runtime. Below we're accessing the mallocgc function. Note that this
// access is necessarily tied to a specific Go release which is why this file
// is protected by a build tag.

//go:linkname cputicks runtime.cputicks
func cputicks() uint64
