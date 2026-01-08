; Enumerate constants

MACRO? const_def
	IF _NARG >= 1
		DEF const_value = \1
	ELSE
		DEF const_value = 0
	ENDC
	IF _NARG >= 2
		DEF const_inc = \2
	ELSE
		DEF const_inc = 1
	ENDC
	IF _NARG >= 3
		DEF const_max = \3
	ELSE
		DEF const_max = $ff
	ENDC
ENDM

MACRO? max_const_def
	IF _NARG == 1
		const_def 0, 1, \1
	ELIF _NARG == 2
		const_def \2, 1, \1
	ELSE
		const_def \2, \3, \1
	ENDC
ENDM

MACRO? bit_const_def
	max_const_def 7, \#
ENDM

MACRO? nybble_const_def
	max_const_def $f, \#
ENDM

MACRO? listable_const_def
	max_const_def $fe, \# ; $ff aka -1 is reserved for the end-of-list marker
ENDM

MACRO? word_const_def
	max_const_def $ffff, \#
ENDM

MACRO? unlimited_const_def
	max_const_def 0, \#
ENDM

MACRO? check_const_value
	IF const_max
		IF const_inc > 0
			ASSERT const_value <= const_max, \
				"\1 would be {d:const_value}, but cannot be greater than {d:const_max}"
		ELSE
			ASSERT const_value >= const_max, \
				"\1 would be {d:const_value}, but cannot be less than {d:const_max}"
		ENDC
	ENDC
ENDM

MACRO? const
	check_const_value \1
	DEF \1 EQU const_value
	DEF const_value += const_inc
ENDM

MACRO? const_export
	const \1
	EXPORT \1
ENDM

MACRO? shift_const
	check_const_value \1
	DEF \1 EQU 1 << const_value
	DEF const_value += const_inc
ENDM

MACRO? const_skip
	if _NARG >= 1
		DEF const_value += const_inc * (\1)
	else
		DEF const_value += const_inc
	endc
	check_const_value The next constant
ENDM

MACRO? const_next
	if (const_value > 0 && \1 < const_value) || (const_value < 0 && \1 > const_value)
		fail "const_next cannot go backwards from {const_value} to \1"
	else
		DEF const_value = \1
		check_const_value The next constant
	endc
ENDM

MACRO? dw_const
	dw \1
	const \2
ENDM

MACRO? rb_skip
	IF _NARG == 1
		rsset _RS + \1
	ELSE
		rsset _RS + 1
	ENDC
ENDM
