; Value macros

percent EQUS "* $ff / 100"

bcd2: MACRO
	dn ((\1) / 1000) % 10, ((\1) / 100) % 10
	dn ((\1) / 10) % 10, (\1) % 10
ENDM

bcd3: MACRO
	dn ((\1) / 100000) % 10, ((\1) / 10000) % 10
	dn ((\1) / 1000) % 10, ((\1) / 100) % 10
	dn ((\1) / 10) % 10, (\1) % 10
ENDM

coins equs "bcd2"
money equs "bcd3"

tmlearn: MACRO
x = 0
	REPT _NARG
IF \1 != 0
x = x | (1 << ((\1 - 1) % 8))
ENDC
	SHIFT
	ENDR
	db x
ENDM


; Constant data (db, dw, dl) macros

dn: MACRO ; nybbles
	db (\1 << 4 | \2)
ENDM

dbw: MACRO
	db \1
	dw \2
ENDM

dba: MACRO
	dbw BANK(\1), \1
ENDM

dwb: MACRO
	dw \1
	db \2
ENDM

dab: MACRO
	dwb \1, BANK(\1)
ENDM

dbbw: MACRO
	db \1, \2
	dw \3
ENDM
