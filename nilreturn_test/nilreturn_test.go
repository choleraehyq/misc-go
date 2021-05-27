package main

import (
	"fmt"
	"testing"
)

var i int

type S struct {
	i int
}

func (this *S) F(a string) *S {
	if this == nil {
		return nil
	}
	fmt.Println("FFF")
	return &S{}
}

func BenchmarkNilChain(b *testing.B) {
	var p *S
	if i != 0 {
		p = &S{}
	}
	for i := 0; i < b.N; i++ {
		p.F("").F("").F("").F("").F("").F("")
	}
}

func BenchmarkNilOneChain(b *testing.B) {
	var p *S
	if i != 0 {
		p = &S{}
	}
	for i := 0; i < b.N; i++ {
		p.F("")
	}
}

type Field struct {
	Key       string
	Type      uint8
	Integer   int64
	String    string
	Interface interface{}
}

func String(a string) Field {
	return Field{String: a}
}

func Info(f ...Field) {
	if i == 0 {
		return
	}
	fmt.Println(f)
}

func BenchmarkField(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Info(
			String("a"),
			String("a"),
			String("a"),
			String("a"),
			String("a"),
			String("a"))
	}
}
