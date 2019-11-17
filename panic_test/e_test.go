package main

import "testing"

type thrownError struct {
}

func local() {
	defer func() {
		if p := recover(); p != nil {
			if e, ok := p.(thrownError); ok {
				_ = e
			}
		}
	}()
	panic(thrownError{})
}
func BenchmarkPanicRecoverLocal(b *testing.B) {
	for i := 0; i < b.N; i++ {
		local()
	}
}
