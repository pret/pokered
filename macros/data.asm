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

coins EQUS "bcd2"
money EQUS "bcd3"

tmhm: MACRO
; used in data/pokemon/base_stats/*.asm
_tms1 = 0 ; TM01-TM24 (24)
_tms2 = 0 ; TM25-TM48 (24)
_tms3 = 0 ; TM49-TM50 + HM01-HM05 (7/24)
REPT _NARG
	if DEF(\1_TMNUM)
	if \1_TMNUM < 24 + 1
_tms1 = _tms1 | (1 << ((\1_TMNUM) - 1))
	ELIF \1_TMNUM < 48 + 1
_tms2 = _tms2 | (1 << ((\1_TMNUM) - 1 - 24))
	else
_tms3 = _tms3 | (1 << ((\1_TMNUM) - 1 - 48))
	ENDC
	else
		fail "\1 is not a TM or HM move"
	ENDC
	SHIFT
ENDR
REPT 3 ; TM01-TM24 (24/24)
	db _tms1 & $ff
_tms1 = _tms1 >> 8
ENDR
REPT 3 ; TM25-TM48 (24/24)
	db _tms2 & $ff
_tms2 = _tms2 >> 8
ENDR
REPT 1 ; TM49-TM50 + HM01-HM05 (7/8)
	db _tms3 & $ff
_tms3 = _tms3 >> 8
ENDR
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
