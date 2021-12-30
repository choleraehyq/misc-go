package main

import (
	"github.com/choleraehyq/misc-go/constructor_test/c"
)

var a int32

func DoWithNewS() {
	s := c.NewS()
	a = s.A
}

func DoWithS() {
	s := &c.S{}
	a = s.A
}

func main() {
	DoWithNewS()
	DoWithS()
}
