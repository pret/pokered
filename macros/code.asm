; Syntactic sugar macros

MACRO lb ; r, hi, lo
	ld \1, ((\2) & $ff) << 8 + ((\3) & $ff)
ENDM

MACRO ldpal
	ld \1, \2 << 6 | \3 << 4 | \4 << 2 | \5
ENDM

; Design patterns

MACRO dict
	IF \1 == 0
		and a
	ELSE
		cp \1
	ENDC
	jp z, \2
ENDM

; dereference the pointer argument into hl, if no argument just pull reference from hl
MACRO hl_deref
	IF _NARG > 0
		ld hl, \1
	ENDC
	ld a, [hli]
	ld h, [hl]
	ld l, a
ENDM

MACRO de_deref
	IF _NARG > 0
		ld hl, \1
	ENDC
	ld a, [hli]
	ld d, [hl]
	ld e, a
ENDM

MACRO hl_deref_reverse
	IF _NARG > 0
		ld hl, \1 + 1
	ENDC
	ld a, [hld]
	ld h, [hl]
	ld l, a
ENDM

MACRO de_deref_reverse
	IF _NARG > 0
		ld hl, \1 + 1
	ENDC
	ld a, [hld]
	ld d, [hl]
	ld e, a
ENDM

MACRO bc_deref_reverse
	IF _NARG > 0
		ld hl, \1 + 1
	ENDC
	ld a, [hld]
	ld b, [hl]
	ld c, a
ENDM

MACRO lddePlusA ; arg = address to load, result de = arg + a
	add LOW(\1)
	ld e, a
	adc HIGH(\1)
	sub e
	ld d, a
ENDM

MACRO ldhlPlusA ; arg = address to load, result hl = arg + a
	add LOW(\1)
	ld l, a
	adc HIGH(\1)
	sub l
	ld h, a
ENDM

MACRO n_sub_a ; arg = which constant value a will be subtracted from. result a = arg - a
	cpl
	add \1 + 1
ENDM

MACRO srl_a_3x ; optimized version of doing srl a three times (shift a right 3 times) (aka divide by 8)
	rrca
	rrca
	rrca
	and %00011111
ENDM

MACRO inc_a_nc
	sbc -1
ENDM

MACRO dec_a_nc
	adc -1
ENDM