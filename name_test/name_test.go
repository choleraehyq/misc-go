package main

import (
	"reflect"
	"testing"
)

type A struct {
}

func getType(myvar interface{}) string {
	if t := reflect.TypeOf(myvar); t.Kind() == reflect.Ptr {
		return t.Elem().Name()
	} else {
		return t.Name()
	}
}

func BenchmarkStructName(b *testing.B) {
	var a A
	for i := 0; i < b.N; i++ {
		getType(a)
	}
}

func BenchmarkPtrName(b *testing.B) {
	var a *A
	for i := 0; i < b.N; i++ {
		getType(a)
	}
}
