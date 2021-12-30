package main

import "testing"

type S struct {
	p1, p2, p3, p4, p5, p6, p7 *int
	s1, s2                     string
}

var gsp *S
var gs S

//go:noinline
func receivePointer(s *S) {
	gsp = s
}

//go:noinline
func receiveValue(s S) {
	gs = s
}

//go:noinline
func returnPointer() *S {
	return &S{
		s1: "12345",
		s2: "67890",
	}
}

//go:noinline
func returnValue() S {
	return S{
		s1: "12345",
		s2: "67890",
	}
}

func BenchmarkReturnPointer(b *testing.B) {
	var s *S
	for i := 0; i < b.N; i++ {
		s = returnPointer()
	}
	gsp = s
	// b.Log(s)
}

func BenchmarkReturnValue(b *testing.B) {
	var s S
	for i := 0; i < b.N; i++ {
		s = returnValue()
	}
	gs = s
	// b.Log(s)
}

//go:noinline
func callReceivePointer() {
	var s S
	receivePointer(&s)
}

//go:noinline
func callReceiveValue() {
	var s S
	receiveValue(s)
}

func BenchmarkReceiveValue(b *testing.B) {
	for i := 0; i < b.N; i++ {
		callReceiveValue()
	}
}

func BenchmarkReceivePointer(b *testing.B) {
	for i := 0; i < b.N; i++ {
		callReceivePointer()
	}
}
