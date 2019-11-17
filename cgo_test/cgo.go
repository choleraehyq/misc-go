package main

/*
void cfunc() {
}
*/
import "C"

func Call() {
	C.cfunc()
}
