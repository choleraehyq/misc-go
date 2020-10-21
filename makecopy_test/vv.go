package main

func outAcc(n int) (v uint32) {
	var tmp uint32
	for i := 0; i < n; i++ {
		tmp = uint32(i)
		v += tmp
	}
	return
}

func innAcc(n int) (v uint32) {
	for i := 0; i < n; i++ {
		var tmp = uint32(i)
		v += tmp
	}
	return
}
