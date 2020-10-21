"".f STEXT nosplit size=1 args=0x0 locals=0x0
	0x0000 00000 (main.go:9)	TEXT	"".f(SB), NOSPLIT|ABIInternal, $0-0
	0x0000 00000 (main.go:9)	FUNCDATA	$0, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x0000 00000 (main.go:9)	FUNCDATA	$1, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x0000 00000 (main.go:9)	FUNCDATA	$2, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x0000 00000 (main.go:9)	RET
	0x0000 c3                                               .
"".main STEXT size=123 args=0x0 locals=0x18
	0x0000 00000 (main.go:11)	TEXT	"".main(SB), ABIInternal, $24-0
	0x0000 00000 (main.go:11)	MOVQ	(TLS), CX
	0x0009 00009 (main.go:11)	CMPQ	SP, 16(CX)
	0x000d 00013 (main.go:11)	JLS	116
	0x000f 00015 (main.go:11)	SUBQ	$24, SP
	0x0013 00019 (main.go:11)	MOVQ	BP, 16(SP)
	0x0018 00024 (main.go:11)	LEAQ	16(SP), BP
	0x001d 00029 (main.go:11)	FUNCDATA	$0, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x001d 00029 (main.go:11)	FUNCDATA	$1, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x001d 00029 (main.go:11)	FUNCDATA	$2, gclocals·9fb7f0986f647f17cb53dda1484e0f7a(SB)
	0x001d 00029 (main.go:12)	PCDATA	$0, $0
	0x001d 00029 (main.go:12)	PCDATA	$1, $0
	0x001d 00029 (main.go:12)	MOVQ	$1, (SP)
	0x0025 00037 (main.go:12)	CALL	runtime.GOMAXPROCS(SB)
	0x002a 00042 (main.go:13)	MOVL	$0, (SP)
	0x0031 00049 (main.go:13)	PCDATA	$0, $1
	0x0031 00049 (main.go:13)	LEAQ	"".main.func1·f(SB), AX
	0x0038 00056 (main.go:13)	PCDATA	$0, $0
	0x0038 00056 (main.go:13)	MOVQ	AX, 8(SP)
	0x003d 00061 (main.go:13)	CALL	runtime.newproc(SB)
	0x0042 00066 (main.go:19)	MOVQ	$1000000, (SP)
	0x004a 00074 (main.go:19)	CALL	time.Sleep(SB)
	0x004f 00079 (main.go:20)	CALL	runtime.printlock(SB)
	0x0054 00084 (main.go:20)	PCDATA	$0, $1
	0x0054 00084 (main.go:20)	LEAQ	go.string."OK\n"(SB), AX
	0x005b 00091 (main.go:20)	PCDATA	$0, $0
	0x005b 00091 (main.go:20)	MOVQ	AX, (SP)
	0x005f 00095 (main.go:20)	MOVQ	$3, 8(SP)
	0x0068 00104 (main.go:20)	CALL	runtime.printstring(SB)
	0x006d 00109 (main.go:20)	CALL	runtime.printunlock(SB)
	0x0072 00114 (main.go:19)	JMP	66
	0x0074 00116 (main.go:19)	NOP
	0x0074 00116 (main.go:11)	PCDATA	$1, $-1
	0x0074 00116 (main.go:11)	PCDATA	$0, $-1
	0x0074 00116 (main.go:11)	CALL	runtime.morestack_noctxt(SB)
	0x0079 00121 (main.go:11)	JMP	0
	0x0000 65 48 8b 0c 25 00 00 00 00 48 3b 61 10 76 65 48  eH..%....H;a.veH
	0x0010 83 ec 18 48 89 6c 24 10 48 8d 6c 24 10 48 c7 04  ...H.l$.H.l$.H..
	0x0020 24 01 00 00 00 e8 00 00 00 00 c7 04 24 00 00 00  $...........$...
	0x0030 00 48 8d 05 00 00 00 00 48 89 44 24 08 e8 00 00  .H......H.D$....
	0x0040 00 00 48 c7 04 24 40 42 0f 00 e8 00 00 00 00 e8  ..H..$@B........
	0x0050 00 00 00 00 48 8d 05 00 00 00 00 48 89 04 24 48  ....H......H..$H
	0x0060 c7 44 24 08 03 00 00 00 e8 00 00 00 00 e8 00 00  .D$.............
	0x0070 00 00 eb ce e8 00 00 00 00 eb 85                 ...........
	rel 5+4 t=16 TLS+0
	rel 38+4 t=8 runtime.GOMAXPROCS+0
	rel 52+4 t=15 "".main.func1·f+0
	rel 62+4 t=8 runtime.newproc+0
	rel 75+4 t=8 time.Sleep+0
	rel 80+4 t=8 runtime.printlock+0
	rel 87+4 t=15 go.string."OK\n"+0
	rel 105+4 t=8 runtime.printstring+0
	rel 110+4 t=8 runtime.printunlock+0
	rel 117+4 t=8 runtime.morestack_noctxt+0
"".main.func1 STEXT size=41 args=0x0 locals=0x8
	0x0000 00000 (main.go:13)	TEXT	"".main.func1(SB), ABIInternal, $8-0
	0x0000 00000 (main.go:13)	MOVQ	(TLS), CX
	0x0009 00009 (main.go:13)	CMPQ	SP, 16(CX)
	0x000d 00013 (main.go:13)	JLS	34
	0x000f 00015 (main.go:13)	SUBQ	$8, SP
	0x0013 00019 (main.go:13)	MOVQ	BP, (SP)
	0x0017 00023 (main.go:13)	LEAQ	(SP), BP
	0x001b 00027 (main.go:13)	FUNCDATA	$0, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x001b 00027 (main.go:13)	FUNCDATA	$1, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x001b 00027 (main.go:13)	FUNCDATA	$2, gclocals·33cdeccccebe80329f1fdbee7f5874cb(SB)
	0x001b 00027 (main.go:15)	PCDATA	$0, $0
	0x001b 00027 (main.go:15)	PCDATA	$1, $0
	0x001b 00027 (main.go:15)	CALL	"".f(SB)
	0x0020 00032 (main.go:15)	JMP	27
	0x0022 00034 (main.go:15)	NOP
	0x0022 00034 (main.go:13)	PCDATA	$1, $-1
	0x0022 00034 (main.go:13)	PCDATA	$0, $-1
	0x0022 00034 (main.go:13)	CALL	runtime.morestack_noctxt(SB)
	0x0027 00039 (main.go:13)	JMP	0
	0x0000 65 48 8b 0c 25 00 00 00 00 48 3b 61 10 76 13 48  eH..%....H;a.v.H
	0x0010 83 ec 08 48 89 2c 24 48 8d 2c 24 e8 00 00 00 00  ...H.,$H.,$.....
	0x0020 eb f9 e8 00 00 00 00 eb d7                       .........
	rel 5+4 t=16 TLS+0
	rel 28+4 t=8 "".f+0
	rel 35+4 t=8 runtime.morestack_noctxt+0
go.cuinfo.packagename. SDWARFINFO dupok size=0
	0x0000 6d 61 69 6e                                      main
go.loc."".f SDWARFLOC size=0
go.info."".f SDWARFINFO size=30
	0x0000 03 22 22 2e 66 00 00 00 00 00 00 00 00 00 00 00  ."".f...........
	0x0010 00 00 00 00 00 00 01 9c 00 00 00 00 01 00        ..............
	rel 6+8 t=1 "".f+0
	rel 14+8 t=1 "".f+1
	rel 24+4 t=29 gofile../Users/cholerae/Documents/gocode/misc-go/tightloop_test/main.go+0
go.range."".f SDWARFRANGE size=0
go.isstmt."".f SDWARFMISC size=0
	0x0000 04 01 00                                         ...
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
	rel 27+4 t=29 gofile../Users/cholerae/Documents/gocode/misc-go/tightloop_test/main.go+0
go.range."".main SDWARFRANGE size=0
go.isstmt."".main SDWARFMISC size=0
	0x0000 04 0f 04 0e 03 14 01 0c 02 17 01 14 02 0a 01 02  ................
	0x0010 02 07 00                                         ...
go.loc."".main.func1 SDWARFLOC size=0
go.info."".main.func1 SDWARFINFO size=39
	0x0000 03 22 22 2e 6d 61 69 6e 2e 66 75 6e 63 31 00 00  ."".main.func1..
	0x0010 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01  ................
	0x0020 9c 00 00 00 00 01 00                             .......
	rel 15+8 t=1 "".main.func1+0
	rel 23+8 t=1 "".main.func1+41
	rel 33+4 t=29 gofile../Users/cholerae/Documents/gocode/misc-go/tightloop_test/main.go+0
go.range."".main.func1 SDWARFRANGE size=0
go.isstmt."".main.func1 SDWARFMISC size=0
	0x0000 04 0f 04 0c 03 05 01 02 02 07 00                 ...........
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
