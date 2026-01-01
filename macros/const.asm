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
	IF const_inc > 0
		REDEF const_size_compare EQUS "bigger"
		DEF const_format_sign = 1
	ELSE
		REDEF const_size_compare EQUS "smaller"
		DEF const_format_sign = -1
	ENDC
	DEF const_format = $FF
	DEF undefined_const_limit = 1
	IF _NARG >= 3
		IF !STRCMP("\3", "WORD")
			DEF const_format = $FFFF
		ELIF !STRCMP("\3", "NYBBLE")
			DEF const_format = $F
		ELIF !STRCMP("\3", "BIT")
			DEF const_format = 7
		ELSE
			DEF undefined_const_limit = 0
			DEF const_limit = \3
		ENDC
	ENDC
	IF undefined_const_limit
		IF (const_value >= 0 && const_inc > 0) || (const_value <= 0 && const_inc < 0)
			DEF const_limit = const_format_sign * const_format
		ELSE
			DEF const_limit = const_value + const_format_sign * const_format
		ENDC
	ENDC
	REDEF last_const_string EQUS " as first constant."
ENDM

MACRO? const
	IF (const_inc > 0 && const_value > const_limit) || (const_inc < 0 && const_value < const_limit)
		fail "Constant value cannot be {const_size_compare} than {const_limit}. Tried to define constant \1 for value {const_value}{last_const_string}"
	ELSE
		REDEF last_const_string EQUS ". Last valid constant was \1 for value {const_value}."
		DEF \1 EQU const_value
		DEF const_value += const_inc
	ENDC
ENDM

MACRO? const_export
	const \1
	EXPORT \1
ENDM

MACRO? shift_const
	DEF \1 EQU 1 << const_value
	DEF const_value += const_inc
ENDM

MACRO? const_skip
	if _NARG >= 1
		DEF const_value += const_inc * (\1)
	else
		DEF const_value += const_inc
	endc
ENDM

MACRO? const_next
	if (const_value > 0 && \1 < const_value) || (const_value < 0 && \1 > const_value)
		fail "const_next cannot go backwards from {const_value} to \1"
	else
		DEF const_value = \1
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
