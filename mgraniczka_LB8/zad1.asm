$ NOMOD51
$ INCLUDE (8051_mgraniczka.MCU)
CSKB0 EQU 0FF21h

ORG 0000h
_RESET:
	LJMP _INIT

ORG 0100h
_INIT:
	MOV R0,#CSKB0
_LOOP:
	MOVX A,@R0
_IF:	
	CJNE A,#11111110b,_ELSE
	CLR _LED
	LJMP _LOOP
_ELSE:
	SETB _LED
	LJMP _LOOP
END