"".deferLock STEXT size=170 args=0x0 locals=0x28 funcid=0x0
	0x0000 00000 (defer_test.go:11)	TEXT	"".deferLock(SB), ABIInternal, $40-0
	0x0000 00000 (defer_test.go:11)	MOVQ	(TLS), CX
	0x0009 00009 (defer_test.go:11)	CMPQ	SP, 16(CX)
	0x000d 00013 (defer_test.go:11)	PCDATA	$0, $-2
	0x000d 00013 (defer_test.go:11)	JLS	160
	0x0013 00019 (defer_test.go:11)	PCDATA	$0, $-1
	0x0013 00019 (defer_test.go:11)	SUBQ	$40, SP
	0x0017 00023 (defer_test.go:11)	MOVQ	BP, 32(SP)
	0x001c 00028 (defer_test.go:11)	LEAQ	32(SP), BP
	0x0021 00033 (defer_test.go:11)	XORPS	X0, X0
	0x0024 00036 (defer_test.go:11)	MOVUPS	X0, 16(SP)
	0x0029 00041 (defer_test.go:11)	FUNCDATA	$0, gclocals·69c1753bd5f81501d95132d08af04464(SB)
	0x0029 00041 (defer_test.go:11)	FUNCDATA	$1, gclocals·e226d4ae4a7cad8835311c6a4683c14f(SB)
	0x0029 00041 (defer_test.go:11)	FUNCDATA	$5, "".deferLock.opendefer(SB)
	0x0029 00041 (defer_test.go:11)	MOVB	$0, ""..autotmp_3+15(SP)
	0x002e 00046 (<unknown line number>)	NOP
	0x002e 00046 ($GOROOT/src/sync/mutex.go:74)	XORL	AX, AX
	0x0030 00048 ($GOROOT/src/sync/mutex.go:74)	LEAQ	"".mu(SB), CX
	0x0037 00055 ($GOROOT/src/sync/mutex.go:74)	MOVL	$1, DX
	0x003c 00060 ($GOROOT/src/sync/mutex.go:74)	LOCK
	0x003d 00061 ($GOROOT/src/sync/mutex.go:74)	CMPXCHGL	DX, (CX)
	0x0040 00064 ($GOROOT/src/sync/mutex.go:74)	SETEQ	CL
	0x0043 00067 ($GOROOT/src/sync/mutex.go:74)	TESTB	CL, CL
	0x0045 00069 ($GOROOT/src/sync/mutex.go:74)	JEQ	124
	0x0047 00071 (defer_test.go:13)	LEAQ	sync.(*Mutex).Unlock·f(SB), AX
	0x004e 00078 (defer_test.go:13)	MOVQ	AX, ""..autotmp_4+24(SP)
	0x0053 00083 (defer_test.go:13)	LEAQ	"".mu(SB), AX
	0x005a 00090 (defer_test.go:13)	MOVQ	AX, ""..autotmp_5+16(SP)
	0x005f 00095 (defer_test.go:14)	MOVB	$0, ""..autotmp_3+15(SP)
	0x0064 00100 (defer_test.go:14)	MOVQ	""..autotmp_5+16(SP), AX
	0x0069 00105 (defer_test.go:14)	MOVQ	AX, (SP)
	0x006d 00109 (defer_test.go:14)	PCDATA	$1, $1
	0x006d 00109 (defer_test.go:14)	CALL	sync.(*Mutex).Unlock(SB)
	0x0072 00114 (defer_test.go:14)	MOVQ	32(SP), BP
	0x0077 00119 (defer_test.go:14)	ADDQ	$40, SP
	0x007b 00123 (defer_test.go:14)	RET
	0x007c 00124 ($GOROOT/src/sync/mutex.go:81)	LEAQ	"".mu(SB), AX
	0x0083 00131 ($GOROOT/src/sync/mutex.go:81)	MOVQ	AX, (SP)
	0x0087 00135 ($GOROOT/src/sync/mutex.go:81)	CALL	sync.(*Mutex).lockSlow(SB)
	0x008c 00140 (defer_test.go:12)	JMP	71
	0x008e 00142 (defer_test.go:12)	CALL	runtime.deferreturn(SB)
	0x0093 00147 (defer_test.go:12)	MOVQ	32(SP), BP
	0x0098 00152 (defer_test.go:12)	ADDQ	$40, SP
	0x009c 00156 (defer_test.go:12)	RET
	0x009d 00157 (defer_test.go:12)	NOP
	0x009d 00157 (defer_test.go:11)	PCDATA	$1, $-1
	0x009d 00157 (defer_test.go:11)	PCDATA	$0, $-2
	0x009d 00157 (defer_test.go:11)	NOP
	0x00a0 00160 (defer_test.go:11)	CALL	runtime.morestack_noctxt(SB)
	0x00a5 00165 (defer_test.go:11)	PCDATA	$0, $-1
	0x00a5 00165 (defer_test.go:11)	JMP	0
	0x0000 65 48 8b 0c 25 00 00 00 00 48 3b 61 10 0f 86 8d  eH..%....H;a....
	0x0010 00 00 00 48 83 ec 28 48 89 6c 24 20 48 8d 6c 24  ...H..(H.l$ H.l$
	0x0020 20 0f 57 c0 0f 11 44 24 10 c6 44 24 0f 00 31 c0   .W...D$..D$..1.
	0x0030 48 8d 0d 00 00 00 00 ba 01 00 00 00 f0 0f b1 11  H...............
	0x0040 0f 94 c1 84 c9 74 35 48 8d 05 00 00 00 00 48 89  .....t5H......H.
	0x0050 44 24 18 48 8d 05 00 00 00 00 48 89 44 24 10 c6  D$.H......H.D$..
	0x0060 44 24 0f 00 48 8b 44 24 10 48 89 04 24 e8 00 00  D$..H.D$.H..$...
	0x0070 00 00 48 8b 6c 24 20 48 83 c4 28 c3 48 8d 05 00  ..H.l$ H..(.H...
	0x0080 00 00 00 48 89 04 24 e8 00 00 00 00 eb b9 e8 00  ...H..$.........
	0x0090 00 00 00 48 8b 6c 24 20 48 83 c4 28 c3 0f 1f 00  ...H.l$ H..(....
	0x00a0 e8 00 00 00 00 e9 56 ff ff ff                    ......V...
	rel 5+4 t=17 TLS+0
	rel 51+4 t=16 "".mu+0
	rel 74+4 t=16 sync.(*Mutex).Unlock·f+0
	rel 86+4 t=16 "".mu+0
	rel 110+4 t=8 sync.(*Mutex).Unlock+0
	rel 127+4 t=16 "".mu+0
	rel 136+4 t=8 sync.(*Mutex).lockSlow+0
	rel 143+4 t=8 runtime.deferreturn+0
	rel 161+4 t=8 runtime.morestack_noctxt+0
"".noDeferLock STEXT size=140 args=0x0 locals=0x18 funcid=0x0
	0x0000 00000 (defer_test.go:17)	TEXT	"".noDeferLock(SB), ABIInternal, $24-0
	0x0000 00000 (defer_test.go:17)	MOVQ	(TLS), CX
	0x0009 00009 (defer_test.go:17)	CMPQ	SP, 16(CX)
	0x000d 00013 (defer_test.go:17)	PCDATA	$0, $-2
	0x000d 00013 (defer_test.go:17)	JLS	130
	0x000f 00015 (defer_test.go:17)	PCDATA	$0, $-1
	0x000f 00015 (defer_test.go:17)	SUBQ	$24, SP
	0x0013 00019 (defer_test.go:17)	MOVQ	BP, 16(SP)
	0x0018 00024 (defer_test.go:17)	LEAQ	16(SP), BP
	0x001d 00029 (defer_test.go:17)	FUNCDATA	$0, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x001d 00029 (defer_test.go:17)	FUNCDATA	$1, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x001d 00029 (<unknown line number>)	NOP
	0x001d 00029 (defer_test.go:18)	XORL	AX, AX
	0x001f 00031 ($GOROOT/src/sync/mutex.go:74)	LEAQ	"".mu(SB), CX
	0x0026 00038 ($GOROOT/src/sync/mutex.go:74)	MOVL	$1, DX
	0x002b 00043 ($GOROOT/src/sync/mutex.go:74)	LOCK
	0x002c 00044 ($GOROOT/src/sync/mutex.go:74)	CMPXCHGL	DX, (CX)
	0x002f 00047 ($GOROOT/src/sync/mutex.go:74)	SETEQ	DL
	0x0032 00050 ($GOROOT/src/sync/mutex.go:74)	TESTB	DL, DL
	0x0034 00052 ($GOROOT/src/sync/mutex.go:74)	JEQ	103
	0x0036 00054 (defer_test.go:19)	XCHGL	AX, AX
	0x0037 00055 ($GOROOT/src/sync/mutex.go:186)	MOVL	$-1, AX
	0x003c 00060 ($GOROOT/src/sync/mutex.go:186)	LOCK
	0x003d 00061 ($GOROOT/src/sync/mutex.go:186)	XADDL	AX, (CX)
	0x0040 00064 ($GOROOT/src/sync/mutex.go:186)	DECL	AX
	0x0042 00066 ($GOROOT/src/sync/mutex.go:187)	TESTL	AX, AX
	0x0044 00068 ($GOROOT/src/sync/mutex.go:187)	JNE	80
	0x0046 00070 (<unknown line number>)	MOVQ	16(SP), BP
	0x004b 00075 (<unknown line number>)	ADDQ	$24, SP
	0x004f 00079 (<unknown line number>)	RET
	0x0050 00080 ($GOROOT/src/sync/mutex.go:190)	LEAQ	"".mu(SB), CX
	0x0057 00087 ($GOROOT/src/sync/mutex.go:190)	MOVQ	CX, (SP)
	0x005b 00091 ($GOROOT/src/sync/mutex.go:190)	MOVL	AX, 8(SP)
	0x005f 00095 ($GOROOT/src/sync/mutex.go:190)	PCDATA	$1, $0
	0x005f 00095 ($GOROOT/src/sync/mutex.go:190)	NOP
	0x0060 00096 ($GOROOT/src/sync/mutex.go:190)	CALL	sync.(*Mutex).unlockSlow(SB)
	0x0065 00101 ($GOROOT/src/sync/mutex.go:190)	JMP	70
	0x0067 00103 ($GOROOT/src/sync/mutex.go:81)	LEAQ	"".mu(SB), AX
	0x006e 00110 ($GOROOT/src/sync/mutex.go:81)	MOVQ	AX, (SP)
	0x0072 00114 ($GOROOT/src/sync/mutex.go:81)	CALL	sync.(*Mutex).lockSlow(SB)
	0x0077 00119 ($GOROOT/src/sync/mutex.go:74)	LEAQ	"".mu(SB), CX
	0x007e 00126 ($GOROOT/src/sync/mutex.go:74)	NOP
	0x0080 00128 (defer_test.go:18)	JMP	54
	0x0082 00130 (defer_test.go:18)	NOP
	0x0082 00130 (defer_test.go:17)	PCDATA	$1, $-1
	0x0082 00130 (defer_test.go:17)	PCDATA	$0, $-2
	0x0082 00130 (defer_test.go:17)	CALL	runtime.morestack_noctxt(SB)
	0x0087 00135 (defer_test.go:17)	PCDATA	$0, $-1
	0x0087 00135 (defer_test.go:17)	JMP	0
	0x0000 65 48 8b 0c 25 00 00 00 00 48 3b 61 10 76 73 48  eH..%....H;a.vsH
	0x0010 83 ec 18 48 89 6c 24 10 48 8d 6c 24 10 31 c0 48  ...H.l$.H.l$.1.H
	0x0020 8d 0d 00 00 00 00 ba 01 00 00 00 f0 0f b1 11 0f  ................
	0x0030 94 c2 84 d2 74 31 90 b8 ff ff ff ff f0 0f c1 01  ....t1..........
	0x0040 ff c8 85 c0 75 0a 48 8b 6c 24 10 48 83 c4 18 c3  ....u.H.l$.H....
	0x0050 48 8d 0d 00 00 00 00 48 89 0c 24 89 44 24 08 90  H......H..$.D$..
	0x0060 e8 00 00 00 00 eb df 48 8d 05 00 00 00 00 48 89  .......H......H.
	0x0070 04 24 e8 00 00 00 00 48 8d 0d 00 00 00 00 66 90  .$.....H......f.
	0x0080 eb b4 e8 00 00 00 00 e9 74 ff ff ff              ........t...
	rel 5+4 t=17 TLS+0
	rel 34+4 t=16 "".mu+0
	rel 83+4 t=16 "".mu+0
	rel 97+4 t=8 sync.(*Mutex).unlockSlow+0
	rel 106+4 t=16 "".mu+0
	rel 115+4 t=8 sync.(*Mutex).lockSlow+0
	rel 122+4 t=16 "".mu+0
	rel 131+4 t=8 runtime.morestack_noctxt+0
"".BenchmarkDeferLock STEXT size=90 args=0x8 locals=0x10 funcid=0x0
	0x0000 00000 (defer_test.go:22)	TEXT	"".BenchmarkDeferLock(SB), ABIInternal, $16-8
	0x0000 00000 (defer_test.go:22)	MOVQ	(TLS), CX
	0x0009 00009 (defer_test.go:22)	CMPQ	SP, 16(CX)
	0x000d 00013 (defer_test.go:22)	PCDATA	$0, $-2
	0x000d 00013 (defer_test.go:22)	JLS	83
	0x000f 00015 (defer_test.go:22)	PCDATA	$0, $-1
	0x000f 00015 (defer_test.go:22)	SUBQ	$16, SP
	0x0013 00019 (defer_test.go:22)	MOVQ	BP, 8(SP)
	0x0018 00024 (defer_test.go:22)	LEAQ	8(SP), BP
	0x001d 00029 (defer_test.go:22)	FUNCDATA	$0, gclocals·1a65e721a2ccc325b382662e7ffee780(SB)
	0x001d 00029 (defer_test.go:22)	FUNCDATA	$1, gclocals·69c1753bd5f81501d95132d08af04464(SB)
	0x001d 00029 (defer_test.go:22)	XORL	AX, AX
	0x001f 00031 (defer_test.go:22)	NOP
	0x0020 00032 (defer_test.go:23)	JMP	50
	0x0022 00034 (defer_test.go:23)	MOVQ	AX, "".i(SP)
	0x0026 00038 (defer_test.go:24)	PCDATA	$1, $0
	0x0026 00038 (defer_test.go:24)	CALL	"".deferLock(SB)
	0x002b 00043 (defer_test.go:23)	MOVQ	"".i(SP), AX
	0x002f 00047 (defer_test.go:23)	INCQ	AX
	0x0032 00050 (defer_test.go:23)	MOVQ	"".b+24(SP), CX
	0x0037 00055 (defer_test.go:23)	NOP
	0x0040 00064 (defer_test.go:23)	CMPQ	368(CX), AX
	0x0047 00071 (defer_test.go:23)	JGT	34
	0x0049 00073 (defer_test.go:23)	PCDATA	$1, $-1
	0x0049 00073 (defer_test.go:23)	MOVQ	8(SP), BP
	0x004e 00078 (defer_test.go:23)	ADDQ	$16, SP
	0x0052 00082 (defer_test.go:23)	RET
	0x0053 00083 (defer_test.go:23)	NOP
	0x0053 00083 (defer_test.go:22)	PCDATA	$1, $-1
	0x0053 00083 (defer_test.go:22)	PCDATA	$0, $-2
	0x0053 00083 (defer_test.go:22)	CALL	runtime.morestack_noctxt(SB)
	0x0058 00088 (defer_test.go:22)	PCDATA	$0, $-1
	0x0058 00088 (defer_test.go:22)	JMP	0
	0x0000 65 48 8b 0c 25 00 00 00 00 48 3b 61 10 76 44 48  eH..%....H;a.vDH
	0x0010 83 ec 10 48 89 6c 24 08 48 8d 6c 24 08 31 c0 90  ...H.l$.H.l$.1..
	0x0020 eb 10 48 89 04 24 e8 00 00 00 00 48 8b 04 24 48  ..H..$.....H..$H
	0x0030 ff c0 48 8b 4c 24 18 66 0f 1f 84 00 00 00 00 00  ..H.L$.f........
	0x0040 48 39 81 70 01 00 00 7f d9 48 8b 6c 24 08 48 83  H9.p.....H.l$.H.
	0x0050 c4 10 c3 e8 00 00 00 00 eb a6                    ..........
	rel 5+4 t=17 TLS+0
	rel 39+4 t=8 "".deferLock+0
	rel 84+4 t=8 runtime.morestack_noctxt+0
"".BenchmarkNoDeferLock STEXT size=90 args=0x8 locals=0x10 funcid=0x0
	0x0000 00000 (defer_test.go:28)	TEXT	"".BenchmarkNoDeferLock(SB), ABIInternal, $16-8
	0x0000 00000 (defer_test.go:28)	MOVQ	(TLS), CX
	0x0009 00009 (defer_test.go:28)	CMPQ	SP, 16(CX)
	0x000d 00013 (defer_test.go:28)	PCDATA	$0, $-2
	0x000d 00013 (defer_test.go:28)	JLS	83
	0x000f 00015 (defer_test.go:28)	PCDATA	$0, $-1
	0x000f 00015 (defer_test.go:28)	SUBQ	$16, SP
	0x0013 00019 (defer_test.go:28)	MOVQ	BP, 8(SP)
	0x0018 00024 (defer_test.go:28)	LEAQ	8(SP), BP
	0x001d 00029 (defer_test.go:28)	FUNCDATA	$0, gclocals·1a65e721a2ccc325b382662e7ffee780(SB)
	0x001d 00029 (defer_test.go:28)	FUNCDATA	$1, gclocals·69c1753bd5f81501d95132d08af04464(SB)
	0x001d 00029 (defer_test.go:28)	XORL	AX, AX
	0x001f 00031 (defer_test.go:28)	NOP
	0x0020 00032 (defer_test.go:29)	JMP	50
	0x0022 00034 (defer_test.go:29)	MOVQ	AX, "".i(SP)
	0x0026 00038 (defer_test.go:30)	PCDATA	$1, $0
	0x0026 00038 (defer_test.go:30)	CALL	"".noDeferLock(SB)
	0x002b 00043 (defer_test.go:29)	MOVQ	"".i(SP), AX
	0x002f 00047 (defer_test.go:29)	INCQ	AX
	0x0032 00050 (defer_test.go:29)	MOVQ	"".b+24(SP), CX
	0x0037 00055 (defer_test.go:29)	NOP
	0x0040 00064 (defer_test.go:29)	CMPQ	368(CX), AX
	0x0047 00071 (defer_test.go:29)	JGT	34
	0x0049 00073 (defer_test.go:29)	PCDATA	$1, $-1
	0x0049 00073 (defer_test.go:29)	MOVQ	8(SP), BP
	0x004e 00078 (defer_test.go:29)	ADDQ	$16, SP
	0x0052 00082 (defer_test.go:29)	RET
	0x0053 00083 (defer_test.go:29)	NOP
	0x0053 00083 (defer_test.go:28)	PCDATA	$1, $-1
	0x0053 00083 (defer_test.go:28)	PCDATA	$0, $-2
	0x0053 00083 (defer_test.go:28)	CALL	runtime.morestack_noctxt(SB)
	0x0058 00088 (defer_test.go:28)	PCDATA	$0, $-1
	0x0058 00088 (defer_test.go:28)	JMP	0
	0x0000 65 48 8b 0c 25 00 00 00 00 48 3b 61 10 76 44 48  eH..%....H;a.vDH
	0x0010 83 ec 10 48 89 6c 24 08 48 8d 6c 24 08 31 c0 90  ...H.l$.H.l$.1..
	0x0020 eb 10 48 89 04 24 e8 00 00 00 00 48 8b 04 24 48  ..H..$.....H..$H
	0x0030 ff c0 48 8b 4c 24 18 66 0f 1f 84 00 00 00 00 00  ..H.L$.f........
	0x0040 48 39 81 70 01 00 00 7f d9 48 8b 6c 24 08 48 83  H9.p.....H.l$.H.
	0x0050 c4 10 c3 e8 00 00 00 00 eb a6                    ..........
	rel 5+4 t=17 TLS+0
	rel 39+4 t=8 "".noDeferLock+0
	rel 84+4 t=8 runtime.morestack_noctxt+0
go.cuinfo.packagename. SDWARFCUINFO dupok size=0
	0x0000 6d 61 69 6e                                      main
go.info.sync.(*Mutex).Lock$abstract SDWARFABSFCN dupok size=31
	0x0000 04 73 79 6e 63 2e 28 2a 4d 75 74 65 78 29 2e 4c  .sync.(*Mutex).L
	0x0010 6f 63 6b 00 01 01 11 6d 00 00 00 00 00 00 00     ock....m.......
	rel 0+0 t=24 type.*sync.Mutex+0
	rel 26+4 t=29 go.info.*sync.Mutex+0
go.info.sync.(*Mutex).Unlock$abstract SDWARFABSFCN dupok size=44
	0x0000 04 73 79 6e 63 2e 28 2a 4d 75 74 65 78 29 2e 55  .sync.(*Mutex).U
	0x0010 6e 6c 6f 63 6b 00 01 01 11 6d 00 00 00 00 00 00  nlock....m......
	0x0020 0c 6e 65 77 00 ba 01 00 00 00 00 00              .new........
	rel 0+0 t=24 type.*sync.Mutex+0
	rel 0+0 t=24 type.int32+0
	rel 28+4 t=29 go.info.*sync.Mutex+0
	rel 39+4 t=29 go.info.int32+0
""..inittask SNOPTRDATA size=40
	0x0000 00 00 00 00 00 00 00 00 02 00 00 00 00 00 00 00  ................
	0x0010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0020 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 sync..inittask+0
	rel 32+8 t=1 testing..inittask+0
"".mu SNOPTRBSS size=8
sync.(*Mutex).Unlock·f SRODATA dupok size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=1 sync.(*Mutex).Unlock+0
type..importpath.sync. SRODATA dupok size=7
	0x0000 00 00 04 73 79 6e 63                             ...sync
type..importpath.testing. SRODATA dupok size=10
	0x0000 00 00 07 74 65 73 74 69 6e 67                    ...testing
gclocals·69c1753bd5f81501d95132d08af04464 SRODATA dupok size=8
	0x0000 02 00 00 00 00 00 00 00                          ........
gclocals·e226d4ae4a7cad8835311c6a4683c14f SRODATA dupok size=10
	0x0000 02 00 00 00 02 00 00 00 00 03                    ..........
"".deferLock.opendefer SRODATA dupok size=9
	0x0000 08 11 01 08 08 01 10 08 00                       .........
gclocals·33cdeccccebe80329f1fdbee7f5874cb SRODATA dupok size=8
	0x0000 01 00 00 00 00 00 00 00                          ........
gclocals·1a65e721a2ccc325b382662e7ffee780 SRODATA dupok size=10
	0x0000 02 00 00 00 01 00 00 00 01 00                    ..........
