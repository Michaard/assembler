T0_VAL EQU (65535-46080)
TH0_VAL EQU (T0_VAL/256)
TL0_VAL EQU (T0_VAL mod 256)

ORG 0000h
_RESET:
	LJMP _INIT

ORG 0Bh
_INT_T0:
	CPL 097h
	MOV TL0,#TL0_VAL
	MOV TH0,#TH0_VAL
	RETI

ORG 0100h
_INIT:
	MOV TL0,#TL0_VAL
	MOV TH0,#TH0_VAL
	ANL TCON,#11001111b
	ANL TMOD,#11110001b
	ORL TMOD,#00000001b
	ORL IE,#10000010b
	ORL TCON,#00010000b
_LOOP:
	LJMP _LOOP
END