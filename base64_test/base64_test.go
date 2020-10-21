package main

import (
	"encoding/base64"
	"reflect"
	"sync"
	"testing"
	"unsafe"
)

var data = "g.V(v).properties('name').hasValue('marko a. rodriguez').property('acl','public')"

var p = sync.Pool{
	New: func() interface{} {
		b := make([]byte, base64.RawStdEncoding.EncodedLen(len(data)))
		return &b
	},
}

func BenchmarkBase64ToString(b *testing.B) {
	b.ResetTimer()
	b.ReportAllocs()

	for i := 0; i < b.N; i++ {
		_ = base64.RawURLEncoding.EncodeToString([]byte(data))
	}
}

func unsafeGetBytes(s string, bb []byte) []byte {
	sh := (*reflect.StringHeader)(unsafe.Pointer(&s))
	bh := (*reflect.SliceHeader)(unsafe.Pointer(&bb))
	bh.Len, bh.Cap, bh.Data = sh.Len, sh.Len, sh.Data
	return bb
}

func BenchmarkBase64Encode(b *testing.B) {
	b.ResetTimer()
	b.ReportAllocs()

	for i := 0; i < b.N; i++ {
		bb := p.Get().(*[]byte)
		var tmp []byte
		base64.RawStdEncoding.Encode(*bb, unsafeGetBytes(data, tmp))
		p.Put(bb)
	}
}
