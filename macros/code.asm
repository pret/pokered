; Syntactic sugar macros

MACRO? lb ; r, hi, lo
	ld \1, ((\2) & $ff) << 8 + ((\3) & $ff)
ENDM

MACRO? ldpal
	ld \1, \2 << 6 | \3 << 4 | \4 << 2 | \5
ENDM

; Design patterns

MACRO ld_hli_a_string
	FOR n, CHARLEN(\1) - 1
		ld a, CHARVAL(STRCHAR(\1, n))
		ld [hli], a
	ENDR
	ld [hl], CHARVAL(STRCHAR(\1, CHARLEN(\1) - 1))
ENDM

MACRO dict
	IF \1 == 0
		and a
	ELSE
		cp \1
	ENDC
	jp z, \2
ENDM
