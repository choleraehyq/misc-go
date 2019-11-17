package main

import (
	"testing"
)

type A struct {
  a *int32
  b *int64
  c *[10]byte
  d int32
  f bool
  g bool
  h bool
  i map[string]*int
}

func (this *A) Zero() {
  this.a = nil
  this.b = nil
  this.c = nil
  this.d = 0
  this.f = false
  this.g = false
  this.h = false
  this.i = nil
}

func BenchmarkZero(b *testing.B) {
  var a A
	for i := 0; i < b.N; i++ {
    a.Zero()
	}
}
