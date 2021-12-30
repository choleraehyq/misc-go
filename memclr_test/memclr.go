package main

import "unsafe"

//go:noescape
//go:linkname memclrNoHeapPointers reflect.memclrNoHeapPointers
func memclrNoHeapPointers(ptr unsafe.Pointer, n uintptr)
