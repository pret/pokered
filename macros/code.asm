; Syntactic sugar macros

lb: MACRO ; r, hi, lo
	ld \1, ((\2) & $ff) << 8 + ((\3) & $ff)
ENDM

ldPal: MACRO
	ld \1, \2 << 6 | \3 << 4 | \4 << 2 | \5
ENDM
