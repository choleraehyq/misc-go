package c

type S struct {
	A int32
	b int64
	c [10]byte
	d int32
	f bool
}

func NewS() *S {
	return &S{}
}
