package main

type comparable interface {
	type int, int8, int16, int32, int64, uint, uint8, uint16, uint32, uint64, uintptr, float32, float64
}

type S struct {
}

func (this S) method[T comparable](a, b T) bool {
	return a < b
}

func main() {
	var x S
	var a, b int
	println(x.method(a, b))
}

