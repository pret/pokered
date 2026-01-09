; Enumerate constants

MACRO? const_def
	DEF const_format = $FF
	const_def_common \#
ENDM

MACRO? bit_const_def
	DEF const_format = $7
	const_def_common \#
ENDM

MACRO? nybble_const_def
	DEF const_format = $F
	const_def_common \#
ENDM

MACRO? word_const_def
	DEF const_format = $FFFF
	const_def_common \#
ENDM

MACRO? unlimited_const_def
	ASSERT _NARG <= 2, "Third argument found, unlimited_const_def disable constant value limitations."
	DEF const_format = $FFFFFFFF
	const_def_common \#
ENDM

MACRO? listable_const_def ; Some functions like IsInArray use value $FF as a list terminator.
	IF _NARG == 1
		const_def \1, 1, $FE
	ELIF _NARG == 2
		const_def \1, \2, $FE
	ELSE
		ASSERT _NARG <= 2, "Third argument found, listable_const_def already define constant value limit as $FE."
		const_def 0, 1, $FE
	ENDC
ENDM

MACRO? const_def_common
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
	ELSE ; const_inc < 0
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

	; Checking if the starting constant value is coherant with the value format chosen.
	IF (const_format == $7 || const_format == $F) && (const_value > const_format || const_value < 0)
		IF const_format == $7
			fail "Starting bit_const_def value {d:const_value} outside of range [0 , 7]."
		ELSE ; const_format == $F
			fail "Starting nybble_const_def value {const_value} outside of range [$0 , $F]."
		ENDC
	ELIF const_format == $FF && (const_value < -$100 || const_value > $FF)
		fail "Starting const_def value {const_value} outside of range [-$100, $FF], use word_const_def instead."
	ENDC

	IF const_format != $FFFFFFFF
		IF _NARG >= 3
			DEF const_limit = \3
		ELIF const_format == $F || const_format == 7
			IF const_inc < 0
				DEF const_limit = 0
			ELSE
				DEF const_limit = const_format
			ENDC
		ELSE
			DEF const_limit = const_limit_offset + const_inc_sign * const_format
		ENDC
	ENDC
ENDM

MACRO? const
	IF (const_format != $FFFFFFFF) && ((const_inc > 0 && const_value > const_limit) || (const_inc < 0 && const_value < const_limit))
		fail "Constant value cannot be {const_size_compare} than {const_limit}. Tried to define constant \1 for value {const_value}."
	ELSE
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
