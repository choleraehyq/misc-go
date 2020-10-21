"".main STEXT size=123 args=0x0 locals=0x18
	0x0000 00000 (main.go:8)	TEXT	"".main(SB), ABIInternal, $24-0
	0x0000 00000 (main.go:8)	MOVQ	(TLS), CX
	0x0009 00009 (main.go:8)	CMPQ	SP, 16(CX)
	0x000d 00013 (main.go:8)	PCDATA	$0, $-2
	0x000d 00013 (main.go:8)	JLS	116
	0x000f 00015 (main.go:8)	PCDATA	$0, $-1
	0x000f 00015 (main.go:8)	SUBQ	$24, SP
	0x0013 00019 (main.go:8)	MOVQ	BP, 16(SP)
	0x0018 00024 (main.go:8)	LEAQ	16(SP), BP
	0x001d 00029 (main.go:8)	PCDATA	$0, $-2
	0x001d 00029 (main.go:8)	PCDATA	$1, $-2
	0x001d 00029 (main.go:8)	FUNCDATA	$0, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x001d 00029 (main.go:8)	FUNCDATA	$1, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x001d 00029 (main.go:8)	FUNCDATA	$2, gclocals·9fb7f0986f647f17cb53dda1484e0f7a(SB)
	0x001d 00029 (main.go:9)	PCDATA	$0, $0
	0x001d 00029 (main.go:9)	PCDATA	$1, $0
	0x001d 00029 (main.go:9)	MOVQ	$1, (SP)
	0x0025 00037 (main.go:9)	CALL	runtime.GOMAXPROCS(SB)
	0x002a 00042 (main.go:10)	MOVL	$0, (SP)
	0x0031 00049 (main.go:10)	PCDATA	$0, $1
	0x0031 00049 (main.go:10)	LEAQ	"".main.func1·f(SB), AX
	0x0038 00056 (main.go:10)	PCDATA	$0, $0
	0x0038 00056 (main.go:10)	MOVQ	AX, 8(SP)
	0x003d 00061 (main.go:10)	CALL	runtime.newproc(SB)
	0x0042 00066 (main.go:15)	MOVQ	$1000000, (SP)
	0x004a 00074 (main.go:15)	CALL	time.Sleep(SB)
	0x004f 00079 (main.go:16)	CALL	runtime.printlock(SB)
	0x0054 00084 (main.go:16)	PCDATA	$0, $1
	0x0054 00084 (main.go:16)	LEAQ	go.string."OK\n"(SB), AX
	0x005b 00091 (main.go:16)	PCDATA	$0, $0
	0x005b 00091 (main.go:16)	MOVQ	AX, (SP)
	0x005f 00095 (main.go:16)	MOVQ	$3, 8(SP)
	0x0068 00104 (main.go:16)	CALL	runtime.printstring(SB)
	0x006d 00109 (main.go:16)	CALL	runtime.printunlock(SB)
	0x0072 00114 (main.go:16)	JMP	66
	0x0074 00116 (main.go:16)	NOP
	0x0074 00116 (main.go:8)	PCDATA	$1, $-1
	0x0074 00116 (main.go:8)	PCDATA	$0, $-2
	0x0074 00116 (main.go:8)	CALL	runtime.morestack_noctxt(SB)
	0x0079 00121 (main.go:8)	PCDATA	$0, $-1
	0x0079 00121 (main.go:8)	JMP	0
	0x0000 65 48 8b 0c 25 00 00 00 00 48 3b 61 10 76 65 48  eH..%....H;a.veH
	0x0010 83 ec 18 48 89 6c 24 10 48 8d 6c 24 10 48 c7 04  ...H.l$.H.l$.H..
	0x0020 24 01 00 00 00 e8 00 00 00 00 c7 04 24 00 00 00  $...........$...
	0x0030 00 48 8d 05 00 00 00 00 48 89 44 24 08 e8 00 00  .H......H.D$....
	0x0040 00 00 48 c7 04 24 40 42 0f 00 e8 00 00 00 00 e8  ..H..$@B........
	0x0050 00 00 00 00 48 8d 05 00 00 00 00 48 89 04 24 48  ....H......H..$H
	0x0060 c7 44 24 08 03 00 00 00 e8 00 00 00 00 e8 00 00  .D$.............
	0x0070 00 00 eb ce e8 00 00 00 00 eb 85                 ...........
	rel 5+4 t=17 TLS+0
	rel 38+4 t=8 runtime.GOMAXPROCS+0
	rel 52+4 t=16 "".main.func1·f+0
	rel 62+4 t=8 runtime.newproc+0
	rel 75+4 t=8 time.Sleep+0
	rel 80+4 t=8 runtime.printlock+0
	rel 87+4 t=16 go.string."OK\n"+0
	rel 105+4 t=8 runtime.printstring+0
	rel 110+4 t=8 runtime.printunlock+0
	rel 117+4 t=8 runtime.morestack_noctxt+0
"".main.func1 STEXT nosplit size=3 args=0x0 locals=0x0
	0x0000 00000 (main.go:10)	TEXT	"".main.func1(SB), NOSPLIT|ABIInternal, $0-0
	0x0000 00000 (main.go:10)	PCDATA	$0, $-2
	0x0000 00000 (main.go:10)	PCDATA	$1, $-2
	0x0000 00000 (main.go:10)	FUNCDATA	$0, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x0000 00000 (main.go:10)	FUNCDATA	$1, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x0000 00000 (main.go:10)	FUNCDATA	$2, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x0000 00000 (main.go:11)	XCHGL	AX, AX
	0x0001 00001 (main.go:1048575)	JMP	0
	0x0000 90 eb fd                                         ...
go.cuinfo.packagename. SDWARFINFO dupok size=0
	0x0000 6d 61 69 6e                                      main
go.string."OK" SRODATA dupok size=2
	0x0000 4f 4b                                            OK
go.string."OK\n" SRODATA dupok size=3
	0x0000 4f 4b 0a                                         OK.
go.loc."".main SDWARFLOC size=0
go.info."".main SDWARFINFO size=33
	0x0000 03 22 22 2e 6d 61 69 6e 00 00 00 00 00 00 00 00  ."".main........
	0x0010 00 00 00 00 00 00 00 00 00 01 9c 00 00 00 00 01  ................
	0x0020 00                                               .
	rel 9+8 t=1 "".main+0
	rel 17+8 t=1 "".main+123
	rel 27+4 t=30 gofile../Users/cholerae/Documents/gocode/misc-go/tightloop_test/main.go+0
go.range."".main SDWARFRANGE size=0
go.debuglines."".main SDWARFMISC size=29
	0x0000 04 02 03 02 14 0a a5 9c 06 5f 06 42 06 55 06 be  ........._.B.U..
	0x0010 92 06 41 06 08 03 7c 5b 04 01 03 79 01           ..A...|[...y.
go.loc."".main.func1 SDWARFLOC size=0
go.info."".main.func1 SDWARFINFO size=39
	0x0000 03 22 22 2e 6d 61 69 6e 2e 66 75 6e 63 31 00 00  ."".main.func1..
	0x0010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01  ................
	0x0020 9c 00 00 00 00 01 00                             .......
	rel 15+8 t=1 "".main.func1+0
	rel 23+8 t=1 "".main.func1+3
	rel 33+4 t=30 gofile../Users/cholerae/Documents/gocode/misc-go/tightloop_test/main.go+0
go.range."".main.func1 SDWARFRANGE size=0
go.debuglines."".main.func1 SDWARFMISC size=17
	0x0000 04 02 03 05 14 03 ef ff 3f 1e 04 01 03 82 80 40  ........?......@
	0x0010 01                                               .
""..inittask SNOPTRDATA size=40
	0x0000 00 00 00 00 00 00 00 00 02 00 00 00 00 00 00 00  ................
	0x0010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
	0x0020 00 00 00 00 00 00 00 00                          ........
	rel 24+8 t=1 runtime..inittask+0
	rel 32+8 t=1 time..inittask+0
"".main.func1·f SRODATA dupok size=8
	0x0000 00 00 00 00 00 00 00 00                          ........
	rel 0+8 t=1 "".main.func1+0
type..importpath.runtime. SRODATA dupok size=10
	0x0000 00 00 07 72 75 6e 74 69 6d 65                    ...runtime
type..importpath.time. SRODATA dupok size=7
	0x0000 00 00 04 74 69 6d 65                             ...time
gclocals·33cdeccccebe80329f1fdbee7f5874cb SRODATA dupok size=8
	0x0000 01 00 00 00 00 00 00 00                          ........
gclocals·9fb7f0986f647f17cb53dda1484e0f7a SRODATA dupok size=10
	0x0000 02 00 00 00 01 00 00 00 00 01                    ..........
