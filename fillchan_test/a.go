package main
import (
	
)

func main() {
	ch := make(chan int, 1000)
	println(len(ch))
}
