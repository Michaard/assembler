$ NOMOD51
$ INCLUDE (8051_mgraniczka.MCU)

T0_VAL EQU (65535-46080)
TL0_VAL EQU (T0_VAL mod 256)
TH0_VAL EQU (T0_VAL/256)

ORG 0000h
_RESET:
	LJMP _INIT

ORG 0Bh
_INT_T0:
	ORL TL0,#TL0_VAL
	MOV TH0,#TH0_VAL
	INC _COUNTER
	RETI

ORG 0100h
_INIT:
	MOV _COUNTER,#0d
	MOV _SEC,#0d
	MOV TL0,#TL0_VAL
	MOV TH0,#TH0_VAL
	ANL TCON,#11001111b
	ANL TMOD,#11110001b
	ORL TMOD,#00000001b
	ORL IE,#10000010b
	ORL TCON,#00010000b
_LOOP:
	MOV A,_COUNTER
	CJNE A,#20d,_CD
	MOV _COUNTER,#0d
	INC _SEC
	CPL _LED
_CD:
	LJMP _LOOP
END