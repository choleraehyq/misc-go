package main

import "testing"

const (
	times = 10000000
)

/*
func BenchmarkArray(b *testing.B) {
	var a [times]string
	for i := 0; i < b.N; i++ {
		for j := 0; j < times; j++ {
			a[j] = "abc"
		}
	}
}

func BenchmarkSlice(b *testing.B) {
	a := make([]string, times)
	for i := 0; i < b.N; i++ {
		for j := 0; j < times; j++ {
			a[j] = "abc"
		}
	}
}
*/

func BenchmarkArray(b *testing.B) {
	var a [times]string
	//for i := range a {
	//      a[i] = "hello"
	//}
	for i := 0; i < times; i++ {
		a[i] = "hello"
	}
}
func BenchmarkSlice(b *testing.B) {
	s := make([]string, times, times)
	for i := 0; i < times; i++ {
		s[i] = "hello"
	}
}
