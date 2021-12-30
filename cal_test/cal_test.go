package main

import "testing"

var a, a2 [60000]float64

func BenchmarkHelloWorld(b *testing.B) {
	for i := 1; i < len(a); i++ {
		a[i] = a[i-1] + 1
		a2[i] = a2[i-1] + 1
	}
	sum := float64(0)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j := 0; j < len(a); j++ {
			for k := 0; k < len(a2); k++ {
				sum = a[j] / a2[k]
			}
		}
	}
	println(sum)
}

func Testabc(t *testing.T) {
	t.Errorf("fuck")
}
