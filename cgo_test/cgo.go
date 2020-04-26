package main

/*
void cfunc() {
}

int cadd(int i) {
  return i+1;
}
*/
import "C"

func Call() {
	C.cfunc()
}

func add(i int) int {
	return i + 1
}

func GoAdd(i int) int {
	return add(i)
}

func CAdd(i int) int {
	return int(C.cadd(C.int(i)))
}
