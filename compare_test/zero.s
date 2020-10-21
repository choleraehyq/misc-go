"".init.0 STEXT size=169 args=0x0 locals=0x30
	0x0000 00000 (zero_struct_test.go:21)	TEXT	"".init.0(SB), ABIInternal, $48-0
	0x0000 00000 (zero_struct_test.go:21)	MOVQ	(TLS), CX
	0x0009 00009 (zero_struct_test.go:21)	CMPQ	SP, 16(CX)
	0x000d 00013 (zero_struct_test.go:21)	PCDATA	$0, $-2
	0x000d 00013 (zero_struct_test.go:21)	JLS	159
	0x0013 00019 (zero_struct_test.go:21)	PCDATA	$0, $-1
	0x0013 00019 (zero_struct_test.go:21)	SUBQ	$48, SP
	0x0017 00023 (zero_struct_test.go:21)	MOVQ	BP, 40(SP)
	0x001c 00028 (zero_struct_test.go:21)	LEAQ	40(SP), BP
	0x0021 00033 (zero_struct_test.go:21)	PCDATA	$0, $-2
	0x0021 00033 (zero_struct_test.go:21)	PCDATA	$1, $-2
	0x0021 00033 (zero_struct_test.go:21)	FUNCDATA	$0, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x0021 00033 (zero_struct_test.go:21)	FUNCDATA	$1, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x0021 00033 (zero_struct_test.go:21)	FUNCDATA	$2, gclocals·7b831a0687f0b05b7d2f5ab95b9974aa(SB)
	0x0021 00033 (zero_struct_test.go:21)	PCDATA	$0, $0
	0x0021 00033 (zero_struct_test.go:21)	PCDATA	$1, $0
	0x0021 00033 (zero_struct_test.go:21)	XORL	AX, AX
	0x0023 00035 (zero_struct_test.go:22)	JMP	141
	0x0025 00037 (zero_struct_test.go:22)	MOVQ	AX, "".i+32(SP)
	0x002a 00042 (<unknown line number>)	NOP
	0x002a 00042 ($GOROOT/src/math/rand/rand.go:337)	PCDATA	$0, $1
	0x002a 00042 ($GOROOT/src/math/rand/rand.go:337)	MOVQ	math/rand.globalRand(SB), AX
	0x0031 00049 ($GOROOT/src/math/rand/rand.go:337)	PCDATA	$0, $0
	0x0031 00049 ($GOROOT/src/math/rand/rand.go:337)	MOVQ	AX, (SP)
	0x0035 00053 ($GOROOT/src/math/rand/rand.go:337)	MOVQ	$10000, 8(SP)
	0x003e 00062 ($GOROOT/src/math/rand/rand.go:337)	CALL	math/rand.(*Rand).Intn(SB)
	0x0043 00067 (<unknown line number>)	NOP
	0x0043 00067 ($GOROOT/src/math/rand/rand.go:337)	MOVQ	16(SP), AX
	0x0048 00072 ($GOROOT/src/math/rand/rand.go:337)	MOVQ	AX, "".~R0+24(SP)
	0x004d 00077 ($GOROOT/src/math/rand/rand.go:337)	PCDATA	$0, $2
	0x004d 00077 ($GOROOT/src/math/rand/rand.go:337)	MOVQ	math/rand.globalRand(SB), CX
	0x0054 00084 ($GOROOT/src/math/rand/rand.go:337)	PCDATA	$0, $0
	0x0054 00084 ($GOROOT/src/math/rand/rand.go:337)	MOVQ	CX, (SP)
	0x0058 00088 ($GOROOT/src/math/rand/rand.go:337)	MOVQ	$10000, 8(SP)
	0x0061 00097 ($GOROOT/src/math/rand/rand.go:337)	CALL	math/rand.(*Rand).Intn(SB)
	0x0066 00102 ($GOROOT/src/math/rand/rand.go:337)	MOVQ	16(SP), AX
	0x006b 00107 (zero_struct_test.go:23)	MOVQ	"".i+32(SP), CX
	0x0070 00112 (zero_struct_test.go:23)	MOVQ	"".~R0+24(SP), DX
	0x0075 00117 (zero_struct_test.go:23)	PCDATA	$0, $3
	0x0075 00117 (zero_struct_test.go:23)	LEAQ	"".posx(SB), BX
	0x007c 00124 (zero_struct_test.go:23)	PCDATA	$0, $0
	0x007c 00124 (zero_struct_test.go:23)	MOVL	DX, (BX)(CX*4)
	0x007f 00127 (zero_struct_test.go:23)	PCDATA	$0, $4
	0x007f 00127 (zero_struct_test.go:23)	LEAQ	"".posy(SB), DX
	0x0086 00134 (zero_struct_test.go:23)	PCDATA	$0, $0
	0x0086 00134 (zero_struct_test.go:23)	MOVL	AX, (DX)(CX*4)
	0x0089 00137 (zero_struct_test.go:22)	LEAQ	1(CX), AX
	0x008d 00141 (zero_struct_test.go:22)	CMPQ	AX, $10000
	0x0093 00147 (zero_struct_test.go:22)	JLT	37
	0x0095 00149 (zero_struct_test.go:22)	PCDATA	$0, $-1
	0x0095 00149 (zero_struct_test.go:22)	PCDATA	$1, $-1
	0x0095 00149 (zero_struct_test.go:22)	MOVQ	40(SP), BP
	0x009a 00154 (zero_struct_test.go:22)	ADDQ	$48, SP
	0x009e 00158 (zero_struct_test.go:22)	RET
	0x009f 00159 (zero_struct_test.go:22)	NOP
	0x009f 00159 (zero_struct_test.go:21)	PCDATA	$1, $-1
	0x009f 00159 (zero_struct_test.go:21)	PCDATA	$0, $-2
	0x009f 00159 (zero_struct_test.go:21)	CALL	runtime.morestack_noctxt(SB)
	0x00a4 00164 (zero_struct_test.go:21)	PCDATA	$0, $-1
	0x00a4 00164 (zero_struct_test.go:21)	JMP	0
	0x0000 65 48 8b 0c 25 00 00 00 00 48 3b 61 10 0f 86 8c  eH..%....H;a....
	0x0010 00 00 00 48 83 ec 30 48 89 6c 24 28 48 8d 6c 24  ...H..0H.l$(H.l$
	0x0020 28 31 c0 eb 68 48 89 44 24 20 48 8b 05 00 00 00  (1..hH.D$ H.....
	0x0030 00 48 89 04 24 48 c7 44 24 08 10 27 00 00 e8 00  .H..$H.D$..'....
	0x0040 00 00 00 48 8b 44 24 10 48 89 44 24 18 48 8b 0d  ...H.D$.H.D$.H..
	0x0050 00 00 00 00 48 89 0c 24 48 c7 44 24 08 10 27 00  ....H..$H.D$..'.
	0x0060 00 e8 00 00 00 00 48 8b 44 24 10 48 8b 4c 24 20  ......H.D$.H.L$ 
	0x0070 48 8b 54 24 18 48 8d 1d 00 00 00 00 89 14 8b 48  H.T$.H.........H
	0x0080 8d 15 00 00 00 00 89 04 8a 48 8d 41 01 48 3d 10  .........H.A.H=.
	0x0090 27 00 00 7c 90 48 8b 6c 24 28 48 83 c4 30 c3 e8  '..|.H.l$(H..0..
	0x00a0 00 00 00 00 e9 57 ff ff ff                       .....W...
	rel 5+4 t=17 TLS+0
	rel 45+4 t=16 math/rand.globalRand+0
	rel 63+4 t=8 math/rand.(*Rand).Intn+0
	rel 80+4 t=16 math/rand.globalRand+0
	rel 98+4 t=8 math/rand.(*Rand).Intn+0
	rel 120+4 t=16 "".posx+0
	rel 130+4 t=16 "".posy+0
	rel 160+4 t=8 runtime.morestack_noctxt+0
"".BenchmarkNaive STEXT nosplit size=95 args=0x8 locals=0x0
	0x0000 00000 (zero_struct_test.go:27)	TEXT	"".BenchmarkNaive(SB), NOSPLIT|ABIInternal, $0-8
	0x0000 00000 (zero_struct_test.go:27)	PCDATA	$0, $-2
	0x0000 00000 (zero_struct_test.go:27)	PCDATA	$1, $-2
	0x0000 00000 (zero_struct_test.go:27)	FUNCDATA	$0, gclocals·1a65e721a2ccc325b382662e7ffee780(SB)
	0x0000 00000 (zero_struct_test.go:27)	FUNCDATA	$1, gclocals·69c1753bd5f81501d95132d08af04464(SB)
	0x0000 00000 (zero_struct_test.go:27)	FUNCDATA	$2, gclocals·e01e3150cf2a11a4016430fe270e9b64(SB)
	0x0000 00000 (zero_struct_test.go:28)	PCDATA	$0, $1
	0x0000 00000 (zero_struct_test.go:28)	PCDATA	$1, $1
	0x0000 00000 (zero_struct_test.go:28)	MOVQ	"".b+8(SP), AX
	0x0005 00005 (zero_struct_test.go:28)	XORL	CX, CX
	0x0007 00007 (zero_struct_test.go:28)	JMP	81
	0x0009 00009 (zero_struct_test.go:30)	INCQ	DX
	0x000c 00012 (zero_struct_test.go:30)	CMPQ	DX, $10000
	0x0013 00019 (zero_struct_test.go:30)	JGE	78
	0x0015 00021 (zero_struct_test.go:31)	PCDATA	$0, $2
	0x0015 00021 (zero_struct_test.go:31)	LEAQ	"".posx(SB), BX
	0x001c 00028 (zero_struct_test.go:31)	PCDATA	$0, $1
	0x001c 00028 (zero_struct_test.go:31)	MOVL	(BX)(DX*4), SI
	0x001f 00031 (zero_struct_test.go:32)	PCDATA	$0, $3
	0x001f 00031 (zero_struct_test.go:32)	LEAQ	"".posy(SB), DI
	0x0026 00038 (zero_struct_test.go:32)	PCDATA	$0, $1
	0x0026 00038 (zero_struct_test.go:32)	MOVL	(DI)(DX*4), R8
	0x002a 00042 (zero_struct_test.go:33)	CMPL	SI, $3333
	0x0030 00048 (zero_struct_test.go:33)	JCS	9
	0x0032 00050 (zero_struct_test.go:33)	CMPL	SI, $6666
	0x0038 00056 (zero_struct_test.go:33)	JHI	9
	0x003a 00058 (zero_struct_test.go:33)	CMPL	R8, $4000
	0x0041 00065 (zero_struct_test.go:33)	JCS	9
	0x0043 00067 (zero_struct_test.go:33)	CMPL	R8, $9000
	0x004a 00074 (zero_struct_test.go:33)	JLS	9
	0x004c 00076 (zero_struct_test.go:33)	JMP	9
	0x004e 00078 (zero_struct_test.go:28)	INCQ	CX
	0x0051 00081 (zero_struct_test.go:28)	CMPQ	272(AX), CX
	0x0058 00088 (zero_struct_test.go:28)	JLE	94
	0x005a 00090 (zero_struct_test.go:28)	XORL	DX, DX
	0x005c 00092 (zero_struct_test.go:30)	JMP	12
	0x005e 00094 (zero_struct_test.go:28)	PCDATA	$0, $-1
	0x005e 00094 (zero_struct_test.go:28)	PCDATA	$1, $-1
	0x005e 00094 (zero_struct_test.go:28)	RET
	0x0000 48 8b 44 24 08 31 c9 eb 48 48 ff c2 48 81 fa 10  H.D$.1..HH..H...
	0x0010 27 00 00 7d 39 48 8d 1d 00 00 00 00 8b 34 93 48  '..}9H.......4.H
	0x0020 8d 3d 00 00 00 00 44 8b 04 97 81 fe 05 0d 00 00  .=....D.........
	0x0030 72 d7 81 fe 0a 1a 00 00 77 cf 41 81 f8 a0 0f 00  r.......w.A.....
	0x0040 00 72 c6 41 81 f8 28 23 00 00 76 bd eb bb 48 ff  .r.A..(#..v...H.
	0x0050 c1 48 39 88 10 01 00 00 7e 04 31 d2 eb ae c3     .H9.....~.1....
	rel 24+4 t=16 "".posx+0
	rel 34+4 t=16 "".posy+0
"".BenchmarkOpt STEXT nosplit size=90 args=0x8 locals=0x0
	0x0000 00000 (zero_struct_test.go:42)	TEXT	"".BenchmarkOpt(SB), NOSPLIT|ABIInternal, $0-8
	0x0000 00000 (zero_struct_test.go:42)	PCDATA	$0, $-2
	0x0000 00000 (zero_struct_test.go:42)	PCDATA	$1, $-2
	0x0000 00000 (zero_struct_test.go:42)	FUNCDATA	$0, gclocals·1a65e721a2ccc325b382662e7ffee780(SB)
	0x0000 00000 (zero_struct_test.go:42)	FUNCDATA	$1, gclocals·69c1753bd5f81501d95132d08af04464(SB)
	0x0000 00000 (zero_struct_test.go:42)	FUNCDATA	$2, gclocals·e01e3150cf2a11a4016430fe270e9b64(SB)
	0x0000 00000 (zero_struct_test.go:43)	PCDATA	$0, $1
	0x0000 00000 (zero_struct_test.go:43)	PCDATA	$1, $1
	0x0000 00000 (zero_struct_test.go:43)	MOVQ	"".b+8(SP), AX
	0x0005 00005 (zero_struct_test.go:43)	XORL	CX, CX
	0x0007 00007 (zero_struct_test.go:43)	JMP	76
	0x0009 00009 (zero_struct_test.go:45)	INCQ	DX
	0x000c 00012 (zero_struct_test.go:45)	CMPQ	DX, $10000
	0x0013 00019 (zero_struct_test.go:45)	JGE	73
	0x0015 00021 (zero_struct_test.go:46)	PCDATA	$0, $2
	0x0015 00021 (zero_struct_test.go:46)	LEAQ	"".posx(SB), BX
	0x001c 00028 (zero_struct_test.go:46)	PCDATA	$0, $1
	0x001c 00028 (zero_struct_test.go:46)	MOVL	(BX)(DX*4), SI
	0x001f 00031 (zero_struct_test.go:47)	PCDATA	$0, $3
	0x001f 00031 (zero_struct_test.go:47)	LEAQ	"".posy(SB), DI
	0x0026 00038 (zero_struct_test.go:47)	PCDATA	$0, $1
	0x0026 00038 (zero_struct_test.go:47)	MOVL	(DI)(DX*4), R8
	0x002a 00042 (zero_struct_test.go:48)	ADDL	$-3333, SI
	0x0030 00048 (zero_struct_test.go:48)	CMPL	SI, $3333
	0x0036 00054 (zero_struct_test.go:48)	JCC	9
	0x0038 00056 (zero_struct_test.go:48)	LEAL	-4000(R8), SI
	0x003f 00063 (zero_struct_test.go:48)	CMPL	SI, $5000
	0x0045 00069 (zero_struct_test.go:48)	JCS	9
	0x0047 00071 (zero_struct_test.go:48)	JMP	9
	0x0049 00073 (zero_struct_test.go:43)	INCQ	CX
	0x004c 00076 (zero_struct_test.go:43)	CMPQ	272(AX), CX
	0x0053 00083 (zero_struct_test.go:43)	JLE	89
	0x0055 00085 (zero_struct_test.go:43)	XORL	DX, DX
	0x0057 00087 (zero_struct_test.go:45)	JMP	12
	0x0059 00089 (zero_struct_test.go:43)	PCDATA	$0, $-1
	0x0059 00089 (zero_struct_test.go:43)	PCDATA	$1, $-1
	0x0059 00089 (zero_struct_test.go:43)	RET
	0x0000 48 8b 44 24 08 31 c9 eb 43 48 ff c2 48 81 fa 10  H.D$.1..CH..H...
	0x0010 27 00 00 7d 34 48 8d 1d 00 00 00 00 8b 34 93 48  '..}4H.......4.H
	0x0020 8d 3d 00 00 00 00 44 8b 04 97 81 c6 fb f2 ff ff  .=....D.........
	0x0030 81 fe 05 0d 00 00 73 d1 41 8d b0 60 f0 ff ff 81  ......s.A..`....
	0x0040 fe 88 13 00 00 72 c2 eb c0 48 ff c1 48 39 88 10  .....r...H..H9..
	0x0050 01 00 00 7e 04 31 d2 eb b3 c3                    ...~.1....
	rel 24+4 t=16 "".posx+0
	rel 34+4 t=16 "".posy+0
go.cuinfo.packagename. SDWARFINFO dupok size=0
	0x0000 6d 61 69 6e                                      main
go.info.math/rand.Intn$abstract SDWARFINFO dupok size=27
	0x0000 04 6d 61 74 68 2f 72 61 6e 64 2e 49 6e 74 6e 00  .math/rand.Intn.
	0x0010 01 01 11 6e 00 00 00 00 00 00 00                 ...n.......
	rel 0+0 t=24 type.int+0
	rel 22+4 t=29 go.info.int+0
go.loc."".init.0 SDWARFLOC size=55
	0x0000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0010 02 00 91 68 00 00 00 00 00 00 00 00 00 00 00 00  ...h............
	0x0020 00 00 00 00 01 00 50 00 00 00 00 00 00 00 00 00  ......P.........
	0x0030 00 00 00 00 00 00 00                             .......
	rel 0+8 t=53 "".init.0+42
	rel 8+8 t=53 "".init.0+141
	rel 20+8 t=53 "".init.0+141
	rel 28+8 t=53 "".init.0+169
go.info."".init.0 SDWARFINFO size=112
	0x0000 03 22 22 2e 69 6e 69 74 2e 30 00 00 00 00 00 00  ."".init.0......
	0x0010 00 00 00 00 00 00 00 00 00 00 00 01 9c 00 00 00  ................
	0x0020 00 01 14 00 00 00 00 0b 69 00 16 00 00 00 00 00  ........i.......
	0x0030 00 00 00 0a 7e 52 30 00 17 00 00 00 00 00 00 07  ....~R0.........
	0x0040 00 00 00 00 00 00 00 00 00 00 00 00 17 00 00 00  ................
	0x0050 00 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0060 00 00 00 00 00 00 00 00 00 00 17 00 00 00 00 00  ................
	rel 0+0 t=24 type.int+0
	rel 11+8 t=1 "".init.0+0
	rel 19+8 t=1 "".init.0+169
	rel 29+4 t=30 gofile../Users/cholerae/Documents/gocode/misc-go/compare_test/zero_struct_test.go+0
	rel 35+4 t=29 go.range."".init.0+0
	rel 43+4 t=29 go.info.int+0
	rel 47+4 t=29 go.loc."".init.0+0
	rel 57+4 t=29 go.info.int+0
	rel 64+4 t=29 go.info.math/rand.Intn$abstract+0
	rel 68+4 t=29 go.range."".init.0+48
	rel 72+4 t=30 gofile../Users/cholerae/Documents/gocode/misc-go/compare_test/zero_struct_test.go+0
	rel 82+4 t=29 go.info.math/rand.Intn$abstract+0
	rel 86+8 t=1 "".init.0+77
	rel 94+8 t=1 "".init.0+107
	rel 102+4 t=30 gofile../Users/cholerae/Documents/gocode/misc-go/compare_test/zero_struct_test.go+0
go.range."".init.0 SDWARFRANGE size=96
	0x0000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	rel 0+8 t=53 "".init.0+35
	rel 8+8 t=53 "".init.0+42
	rel 16+8 t=53 "".init.0+107
	rel 24+8 t=53 "".init.0+159
	rel 48+8 t=53 "".init.0+42
	rel 56+8 t=53 "".init.0+67
	rel 64+8 t=53 "".init.0+67
	rel 72+8 t=53 "".init.0+77
go.debuglines."".init.0 SDWARFMISC size=43
	0x0000 04 02 03 0f 14 0a cd 06 9b 24 04 12 06 03 b6 02  .........$......
	0x0010 5a 06 55 04 02 06 02 22 03 ca 7d fb 06 41 06 08  Z.U...."..}..A..
	0x0020 18 06 73 06 23 72 04 01 03 6c 01                 ..s.#r...l.
go.loc."".BenchmarkNaive SDWARFLOC size=194
	0x0000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0010 01 00 9c 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0020 00 00 00 01 00 9c 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 00 00 00 00 00 00 01 00 52 00 00 00 00 00 00 00  ........R.......
	0x0050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0060 00 00 00 00 00 00 00 00 00 01 00 51 00 00 00 00  ...........Q....
	0x0070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0080 00 00 00 00 00 00 00 00 00 00 00 00 01 00 54 00  ..............T.
	0x0090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x00a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01  ................
	0x00b0 00 58 00 00 00 00 00 00 00 00 00 00 00 00 00 00  .X..............
	0x00c0 00 00                                            ..
	rel 0+8 t=53 "".BenchmarkNaive+0
	rel 8+8 t=53 "".BenchmarkNaive+12
	rel 19+8 t=53 "".BenchmarkNaive+58
	rel 27+8 t=53 "".BenchmarkNaive+95
	rel 54+8 t=53 "".BenchmarkNaive+58
	rel 62+8 t=53 "".BenchmarkNaive+95
	rel 89+8 t=53 "".BenchmarkNaive+12
	rel 97+8 t=53 "".BenchmarkNaive+95
	rel 124+8 t=53 "".BenchmarkNaive+31
	rel 132+8 t=53 "".BenchmarkNaive+81
	rel 159+8 t=53 "".BenchmarkNaive+42
	rel 167+8 t=53 "".BenchmarkNaive+81
go.info."".BenchmarkNaive SDWARFINFO size=146
	0x0000 03 22 22 2e 42 65 6e 63 68 6d 61 72 6b 4e 61 69  ."".BenchmarkNai
	0x0010 76 65 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ve..............
	0x0020 00 00 00 01 9c 00 00 00 00 01 10 62 00 00 1b 00  ...........b....
	0x0030 00 00 00 00 00 00 00 15 00 00 00 00 00 00 00 00  ................
	0x0040 00 00 00 00 00 00 00 00 0b 6b 00 1c 00 00 00 00  .........k......
	0x0050 00 00 00 00 14 00 00 00 00 0b 69 00 1e 00 00 00  ..........i.....
	0x0060 00 00 00 00 00 15 00 00 00 00 00 00 00 00 00 00  ................
	0x0070 00 00 00 00 00 00 0b 78 00 1f 00 00 00 00 00 00  .......x........
	0x0080 00 00 0b 79 00 20 00 00 00 00 00 00 00 00 00 00  ...y. ..........
	0x0090 00 00                                            ..
	rel 0+0 t=24 type.*testing.B+0
	rel 19+8 t=1 "".BenchmarkNaive+0
	rel 27+8 t=1 "".BenchmarkNaive+95
	rel 37+4 t=30 gofile../Users/cholerae/Documents/gocode/misc-go/compare_test/zero_struct_test.go+0
	rel 47+4 t=29 go.info.*testing.B+0
	rel 51+4 t=29 go.loc."".BenchmarkNaive+0
	rel 56+8 t=1 "".BenchmarkNaive+0
	rel 64+8 t=1 "".BenchmarkNaive+95
	rel 76+4 t=29 go.info.int+0
	rel 80+4 t=29 go.loc."".BenchmarkNaive+54
	rel 85+4 t=29 go.range."".BenchmarkNaive+0
	rel 93+4 t=29 go.info.int+0
	rel 97+4 t=29 go.loc."".BenchmarkNaive+89
	rel 102+8 t=1 "".BenchmarkNaive+21
	rel 110+8 t=1 "".BenchmarkNaive+78
	rel 122+4 t=29 go.info.uint32+0
	rel 126+4 t=29 go.loc."".BenchmarkNaive+124
	rel 134+4 t=29 go.info.uint32+0
	rel 138+4 t=29 go.loc."".BenchmarkNaive+159
go.range."".BenchmarkNaive SDWARFRANGE size=48
	0x0000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	rel 0+8 t=53 "".BenchmarkNaive+9
	rel 8+8 t=53 "".BenchmarkNaive+78
	rel 16+8 t=53 "".BenchmarkNaive+92
	rel 24+8 t=53 "".BenchmarkNaive+94
go.debuglines."".BenchmarkNaive SDWARFMISC size=38
	0x0000 04 02 03 16 14 06 41 06 39 06 73 06 24 06 55 06  ......A.9.s.$.U.
	0x0010 2e 06 55 06 38 06 4b 06 08 03 7f 47 06 73 39 06  ..U.8.K....G.s9.
	0x0020 21 04 01 03 65 01                                !...e.
go.loc."".BenchmarkOpt SDWARFLOC size=194
	0x0000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0010 01 00 9c 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0020 00 00 00 01 00 9c 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 00 00 00 00 00 00 01 00 52 00 00 00 00 00 00 00  ........R.......
	0x0050 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0060 00 00 00 00 00 00 00 00 00 01 00 51 00 00 00 00  ...........Q....
	0x0070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0080 00 00 00 00 00 00 00 00 00 00 00 00 01 00 54 00  ..............T.
	0x0090 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x00a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01  ................
	0x00b0 00 58 00 00 00 00 00 00 00 00 00 00 00 00 00 00  .X..............
	0x00c0 00 00                                            ..
	rel 0+8 t=53 "".BenchmarkOpt+0
	rel 8+8 t=53 "".BenchmarkOpt+12
	rel 19+8 t=53 "".BenchmarkOpt+76
	rel 27+8 t=53 "".BenchmarkOpt+90
	rel 54+8 t=53 "".BenchmarkOpt+76
	rel 62+8 t=53 "".BenchmarkOpt+90
	rel 89+8 t=53 "".BenchmarkOpt+12
	rel 97+8 t=53 "".BenchmarkOpt+90
	rel 124+8 t=53 "".BenchmarkOpt+31
	rel 132+8 t=53 "".BenchmarkOpt+48
	rel 159+8 t=53 "".BenchmarkOpt+42
	rel 167+8 t=53 "".BenchmarkOpt+76
go.info."".BenchmarkOpt SDWARFINFO size=144
	0x0000 03 22 22 2e 42 65 6e 63 68 6d 61 72 6b 4f 70 74  ."".BenchmarkOpt
	0x0010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0020 00 01 9c 00 00 00 00 01 10 62 00 00 2a 00 00 00  .........b..*...
	0x0030 00 00 00 00 00 15 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 00 00 00 00 00 00 0b 6b 00 2b 00 00 00 00 00 00  .......k.+......
	0x0050 00 00 14 00 00 00 00 0b 69 00 2d 00 00 00 00 00  ........i.-.....
	0x0060 00 00 00 15 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0070 00 00 00 00 0b 78 00 2e 00 00 00 00 00 00 00 00  .....x..........
	0x0080 0b 79 00 2f 00 00 00 00 00 00 00 00 00 00 00 00  .y./............
	rel 0+0 t=24 type.*testing.B+0
	rel 17+8 t=1 "".BenchmarkOpt+0
	rel 25+8 t=1 "".BenchmarkOpt+90
	rel 35+4 t=30 gofile../Users/cholerae/Documents/gocode/misc-go/compare_test/zero_struct_test.go+0
	rel 45+4 t=29 go.info.*testing.B+0
	rel 49+4 t=29 go.loc."".BenchmarkOpt+0
	rel 54+8 t=1 "".BenchmarkOpt+0
	rel 62+8 t=1 "".BenchmarkOpt+90
	rel 74+4 t=29 go.info.int+0
	rel 78+4 t=29 go.loc."".BenchmarkOpt+54
	rel 83+4 t=29 go.range."".BenchmarkOpt+0
	rel 91+4 t=29 go.info.int+0
	rel 95+4 t=29 go.loc."".BenchmarkOpt+89
	rel 100+8 t=1 "".BenchmarkOpt+21
	rel 108+8 t=1 "".BenchmarkOpt+73
	rel 120+4 t=29 go.info.uint32+0
	rel 124+4 t=29 go.loc."".BenchmarkOpt+124
	rel 132+4 t=29 go.info.uint32+0
	rel 136+4 t=29 go.loc."".BenchmarkOpt+159
go.range."".BenchmarkOpt SDWARFRANGE size=48
	0x0000 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	rel 0+8 t=53 "".BenchmarkOpt+9
	rel 8+8 t=53 "".BenchmarkOpt+73
	rel 16+8 t=53 "".BenchmarkOpt+87
	rel 24+8 t=53 "".BenchmarkOpt+89
go.debuglines."".BenchmarkOpt SDWARFMISC size=38
	0x0000 04 02 03 25 14 06 41 06 39 06 73 06 24 06 55 06  ...%..A.9.s.$.U.
	0x0010 2e 06 55 06 38 06 4b 06 08 03 7f 15 06 73 39 06  ..U.8.K......s9.
	0x0020 21 04 01 03 56 01                                !...V.
""..inittask SNOPTRDATA size=48
	0x0000 00 00 00 00 00 00 00 00 02 00 00 00 00 00 00 00  ................
	0x0010 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	rel 24+8 t=1 math/rand..inittask+0
	rel 32+8 t=1 testing..inittask+0
	rel 40+8 t=1 "".init.0+0
"".posx SNOPTRBSS size=40000
"".posy SNOPTRBSS size=40000
runtime.memequal64·f SRODATA dupok size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=1 runtime.memequal64+0
runtime.gcbits.01 SRODATA dupok size=1
	0x0000 01                                               .
type..namedata.*[]uint32- SRODATA dupok size=12
	0x0000 00 00 09 2a 5b 5d 75 69 6e 74 33 32              ...*[]uint32
type.*[]uint32 SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 a9 25 88 3f 08 08 08 36 00 00 00 00 00 00 00 00  .%.?...6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*[]uint32-+0
	rel 48+8 t=1 type.[]uint32+0
type.[]uint32 SRODATA dupok size=56
	0x0000 18 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 d4 91 1d 1f 02 08 08 17 00 00 00 00 00 00 00 00  ................
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*[]uint32-+0
	rel 44+4 t=6 type.*[]uint32+0
	rel 48+8 t=1 type.uint32+0
type..eqfunc40000 SRODATA dupok size=16
	0x0000 00 00 00 00 00 00 00 00 40 9c 00 00 00 00 00 00  ........@.......
	rel 0+8 t=1 runtime.memequal_varlen+0
type..namedata.*[10000]uint32- SRODATA dupok size=17
	0x0000 00 00 0e 2a 5b 31 30 30 30 30 5d 75 69 6e 74 33  ...*[10000]uint3
	0x0010 32                                               2
type.*[10000]uint32 SRODATA dupok size=56
	0x0000 08 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00  ................
	0x0010 54 f5 2e 20 08 08 08 36 00 00 00 00 00 00 00 00  T.. ...6........
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime.memequal64·f+0
	rel 32+8 t=1 runtime.gcbits.01+0
	rel 40+4 t=5 type..namedata.*[10000]uint32-+0
	rel 48+8 t=1 type.[10000]uint32+0
runtime.gcbits. SRODATA dupok size=0
type.[10000]uint32 SRODATA dupok size=72
	0x0000 40 9c 00 00 00 00 00 00 00 00 00 00 00 00 00 00  @...............
	0x0010 40 03 eb db 0a 04 04 11 00 00 00 00 00 00 00 00  @...............
	0x0020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0040 10 27 00 00 00 00 00 00                          .'......
	rel 24+8 t=1 type..eqfunc40000+0
	rel 32+8 t=1 runtime.gcbits.+0
	rel 40+4 t=5 type..namedata.*[10000]uint32-+0
	rel 44+4 t=6 type.*[10000]uint32+0
	rel 48+8 t=1 type.uint32+0
	rel 56+8 t=1 type.[]uint32+0
type..importpath.math/rand. SRODATA dupok size=12
	0x0000 00 00 09 6d 61 74 68 2f 72 61 6e 64              ...math/rand
type..importpath.testing. SRODATA dupok size=10
	0x0000 00 00 07 74 65 73 74 69 6e 67                    ...testing
gclocals·33cdeccccebe80329f1fdbee7f5874cb SRODATA dupok size=8
	0x0000 01 00 00 00 00 00 00 00                          ........
gclocals·7b831a0687f0b05b7d2f5ab95b9974aa SRODATA dupok size=13
	0x0000 05 00 00 00 04 00 00 00 00 01 02 08 04           .............
gclocals·1a65e721a2ccc325b382662e7ffee780 SRODATA dupok size=10
	0x0000 02 00 00 00 01 00 00 00 01 00                    ..........
gclocals·69c1753bd5f81501d95132d08af04464 SRODATA dupok size=8
	0x0000 02 00 00 00 00 00 00 00                          ........
gclocals·e01e3150cf2a11a4016430fe270e9b64 SRODATA dupok size=12
	0x0000 04 00 00 00 07 00 00 00 00 01 09 41              ...........A
