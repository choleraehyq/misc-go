package allocate

func fglobalbce() {
	for i := range s {
		s[i] = i // Found IsInBounds
	}
}

func glocalbce() {
	s := s
	for i := range s {
		s[i] = i
	}
}

var s = make([]int, 10000)

/*
func Benchmark_f(b *testing.B) {
	for i := 0; i < b.N; i++ {
		f()
	}
}

func Benchmark_g(b *testing.B) {
	for i := 0; i < b.N; i++ {
		g()
	}
}
*/
