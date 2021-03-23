; Syntactic sugar macros

lb: MACRO ; r, hi, lo
	ld \1, ((\2) & $ff) << 8 + ((\3) & $ff)
ENDM

ldpal: MACRO
	ld \1, \2 << 6 | \3 << 4 | \4 << 2 | \5
ENDM

; Design patterns

dict: MACRO
IF \1 == 0
	and a
ELSE
	cp \1
ENDC
	jp z, \2
ENDM
