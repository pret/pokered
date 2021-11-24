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

; used in data/pokemon/base_stats/*.asm
tmhm: MACRO
; initialize bytes to 0
FOR n, (NUM_TM_HM + 7) / 8
_tm{d:n} = 0
ENDR
; set bits of bytes
REPT _NARG
	IF DEF(\1_TMNUM)
n = (\1_TMNUM - 1) / 8
i = (\1_TMNUM - 1) % 8
_tm{d:n} |= 1 << i
	ELSE
		FAIL "\1 is not a TM or HM move"
	ENDC
	SHIFT
ENDR
; output bytes
FOR n, (NUM_TM_HM + 7) / 8
	db _tm{d:n}
ENDR
ENDM


; Constant data (db, dw, dl) macros

dbw: MACRO
	db \1
	dw \2
ENDM

dwb: MACRO
	dw \1
	db \2
ENDM

dn: MACRO ; nybbles
REPT _NARG / 2
	db ((\1) << 4) | (\2)
	SHIFT 2
ENDR
ENDM

dba: MACRO ; dbw bank, address
REPT _NARG
	dbw BANK(\1), \1
	SHIFT
ENDR
ENDM

dab: MACRO ; dwb address, bank
REPT _NARG
	dwb \1, BANK(\1)
	SHIFT
ENDR
ENDM
