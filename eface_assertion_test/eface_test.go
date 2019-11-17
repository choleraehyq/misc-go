package main

import "testing"

type A struct {
	a *int
	s string
}

type ComplexStruct struct {
	i int64
	s string
	a A
	b *A
}

func BenchmarkEmptyInterfaceAssertion(b *testing.B) {
	var s ComplexStruct
	for i := 0; i < b.N; i++ {
		var i interface{} = &s
		c, _ := i.(*ComplexStruct)
		c.i++
	}
	println(s.i)
}
