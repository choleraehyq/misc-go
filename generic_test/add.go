package main

import (
)

type Addable interface {
	type int, int8, int16, int32, int64,
		uint, uint8, uint16, uint32, uint64, uintptr,
		float32, float64, complex64, complex128,
		string
}

func add[T Addable](a, b T) T {
    return a + b
}

func main() {
    _ = add(1,2)

    _ = add("foo","bar")
}
