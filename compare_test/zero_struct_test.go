package main

import (
	"math/rand"
	"testing"
)

const (
	N     int    = 10000
	start uint32 = 0
	minx  uint32 = 3333
	maxx  uint32 = 6666
	miny  uint32 = 4000
	maxy  uint32 = 9000
)

var (
	posx, posy [N]uint32
)

func init() {
	for i := 0; i < N; i++ {
		posx[i], posy[i] = uint32(rand.Intn(N)), uint32(rand.Intn(N))
	}
}

func BenchmarkNaive(b *testing.B) {
	for k := 0; k < b.N; k++ {
		j := uint32(0)
		for i := 0; i < N; i++ {
			x := posx[i]
			y := posy[i]
			if x >= minx && x <= maxx && y >= miny && y <= maxy {
				j += x + y
			} else {
				j -= x - y
			}
		}
	}
}

func BenchmarkOpt(b *testing.B) {
	for k := 0; k < b.N; k++ {
		j := uint32(0)
		for i := 0; i < N; i++ {
			x := posx[i]
			y := posy[i]
			if ((x - minx) < (maxx - minx)) && ((y - miny) < (maxy - miny)) {
				j += x + y
			} else {
				j -= x - y
			}
		}
	}
}
