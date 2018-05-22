$ NOMOD51
$ INCLUDE (8051_mgraniczka.MCU)

_ST_POINTER EQU 07Fh
CSDB16 EQU 0FF38h
CSDS16 EQU 0FF30h

ORG 0000h
_RESET:
	LJMP _INIT

ORG 0100h
_INIT:
	CLR WYSW
	MOV SP,#_ST_POINTER
	
	MOV DPTR,#CSDS16
	MOV A,#01000000b
	MOVX @DPTR,A

	MOV DPTR,#CSDB16
	MOV A,#00111111b
	MOVX @DPTR,A
_LOOP:
	NOP
	LJMP _LOOP
END