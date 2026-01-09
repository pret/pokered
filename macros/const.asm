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
		DEF const_inc_sign = 1
	ELSE
		REDEF const_size_compare EQUS "smaller"
		DEF const_inc_sign = -1
	ENDC
	IF const_value >= 0 && const_inc > 0
		DEF const_limit_offset = 0
	ELIF const_value < 0 && const_inc < 0
		DEF const_limit_offset = -1
	ELSE
		DEF const_limit_offset = const_value
	ENDC
	IF _NARG >= 3
		IF (!STRCMP("\3", "NYBBLE") || !STRCMP("\3", "BIT"))
			IF !STRCMP("\3", "NYBBLE")
				DEF const_format = $F
			ELSE
				DEF const_format = 7
			ENDC
			IF const_inc < 0
				DEF const_limit = 0
			ELSE
				DEF const_limit = const_format
			ENDC
			IF const_format < const_value || const_value < 0
				fail "When defining \3 constants, starting value must be comprised between 0 and {const_format}"
			ENDC
		ELIF !STRCMP("\3", "WORD")
			DEF const_format = $FFFF
			DEF const_limit = const_limit_offset + const_inc_sign * const_format
		ELSE
			DEF const_limit = \3
			IF -$100 <= \3 <= $FF
				DEF const_format = $FF
			ELSE
				DEF const_format = $FFFF
			ENDC
		ENDC
	ELSE
		IF -$100 <= const_value <= $FF
			DEF const_format = $FF
		ELSE
			DEF const_format = $FFFF
		ENDC
		DEF const_limit = const_limit_offset + const_inc_sign * const_format
	ENDC
	REDEF last_const_string EQUS " as first constant."
ENDM

MACRO? const
	IF (const_inc > 0 && const_value > const_limit) || (const_inc < 0 && const_value < const_limit)
		fail "Constant value cannot be {const_size_compare} than {const_limit}. Tried to define constant \1 for value {const_value}{last_const_string}"
	ELSE
		REDEF last_const_string EQUS ". Last valid constant was \1 for value {const_value}."
		DEF \1 EQU const_value & const_format
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
	if (const_inc > 0 && \1 < const_value) || (const_inc < 0 && \1 > const_value)
		def failed_const_value = \1
		fail "const_next cannot go backwards from {const_value} to {failed_const_value}"
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
