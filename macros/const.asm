; Enumerate constants

; Arguments :
; \1 starting constant value
; \2 incrementation value
; \3 constant value limit
MACRO? const_def
	DEF const_format = $FF
	const_def_common \#
ENDM

MACRO? bit_const_def
	DEF const_format = $7
	REDEF const_format_string EQUS "bit"
	const_def_common \#
ENDM

MACRO? nybble_const_def
	DEF const_format = $F
	REDEF const_format_string EQUS "nybble"
	const_def_common \#
ENDM

MACRO? word_const_def
	DEF const_format = $FFFF
	const_def_common \#
ENDM

; Disable constant limit verification.
MACRO? unlimited_const_def
	ASSERT WARN, _NARG <= 2, "Third argument found, unlimited_const_def disable constant value limitations."
	DEF const_format = $FFFFFFFF
	const_def_common \#
ENDM

; Some functions like IsInArray use value $FF as a list terminator. Predefine constant limit as $FE
MACRO? listable_const_def
	ASSERT WARN, _NARG <= 2, "Third argument found, listable_const_def already define constant value limit as $FE."
	max_const_def $FE, \#
ENDM

; max_* variations of the macros define the constant limit with the first argument
MACRO? max_const_def
	DEF const_format = $FF
	max_const_def_common \#
ENDM

MACRO? max_bit_const_def
	DEF const_format = $7
	REDEF const_format_string EQUS "bit"
	max_const_def_common \#
ENDM

MACRO? max_nybble_const_def
	DEF const_format = $F
	REDEF const_format_string EQUS "nybble"
	max_const_def_common \#
ENDM

MACRO? max_word_const_def
	DEF const_format = $FFFF
	max_const_def_common \#
ENDM

MACRO? const
	IF (const_format != $FFFFFFFF) && ((const_inc > 0 && const_value > const_limit) || (const_inc < 0 && const_value < const_limit))
		fail "Constant value cannot be {const_size_compare} than {const_limit}. Attempted to define constant \1 for value {const_value}."
	ELSE
		DEF \1 EQU const_value
		DEF const_value += const_inc
	ENDC
ENDM

MACRO? const_export
	const \1
	EXPORT \1
ENDM

MACRO? shift_const
	IF (const_format != $FFFFFFFF) && ((const_inc > 0 && const_value > const_limit) || (const_inc < 0 && const_value < const_limit))
		DEF failed_const_value = 1 << const_value
		fail "Constant value cannot be {const_size_compare} than {const_limit}. Attempted to use constant value {const_value} to define constant \1 for shifted value {failed_const_value}."
	ELSE
		DEF BIT_\1 EQU const_value
		DEF \1 EQU 1 << const_value
		DEF const_value += const_inc
	ENDC
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
		DEF failed_const_value = \1
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

; Macros past this comment arent meant to be used by themselves

MACRO? max_const_def_common
	IF _NARG >= 3
		const_def_common \2, \3, \1
	ELIF _NARG >= 2
		const_def_common \2, 1, \1
	ELIF _NARG >= 1
		const_def_common 0, 1, \1
	ELSE
		const_def_common 0, 1
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
	; pass all constant limit related operations if unlimited_const_def
	IF const_format != $FFFFFFFF
		IF const_inc > 0
			REDEF const_size_compare EQUS "bigger"
		ELSE ; const_inc < 0
			REDEF const_size_compare EQUS "smaller"
		ENDC

		const_def_common_{const_format} \#

		; check the coherance of the starting value and constant limit.
		IF (const_format == $7 || const_format == $F) && (const_limit < 0 || const_limit > const_format)
			fail "Constant limit {const_limit} for {const_format_string}_const_def outside of range [$0 , {const_format}]"
		ELIF (const_format == $7 || const_format == $F) && (const_value < 0 || const_value > const_format)
			fail "Starting constant value {const_value} for {const_format_string}_const_def outside of range [$0 , {const_format}]."
		ELIF (const_inc > 0 && const_value > const_limit) || (const_inc < 0 && const_value < const_limit)
			fail "Starting constant value {const_value} {const_size_compare} than constant limit value {const_limit}."
		ELIF ((const_limit > 0 && const_value < 0) && (const_value & const_format) < const_limit)
			DEF failed_const_value = const_value & const_format
			fail "Starting constant value and constant limit allow an overlap in constant value range [{failed_const_value} , {const_limit}]."
		ELIF ((const_limit < 0 && const_value > 0) && const_value > (const_limit & const_format))
			DEF failed_const_value = const_limit & const_format
			fail "Starting constant value and constant limit allow an overlap in constant value range [{failed_const_value} , {const_value}]."
		ELIF ((const_value & const_format) != const_value && (const_value & const_format) == const_limit) || \
				((const_limit & const_format) != const_limit && const_value == (const_limit & const_format))
			DEF failed_const_value = const_value & const_format
			fail "Starting constant value and constant limit allow an overlap on constant value {failed_const_value}."
		ENDC
	ENDC
ENDM

MACRO? const_def_common_$FFFF
	const_def_common_$FF \#
ENDM
MACRO? const_def_common_$FF
	IF const_value >= 0 && const_inc > 0
		DEF const_limit_offset = 0
	ELIF const_value < 0 && const_inc < 0
		DEF const_limit_offset = -1
	ELSE
		DEF const_limit_offset = const_value
	ENDC

	; change default $FF const_format to $FFFF if starting constant value is outside of [-$100 ; $FF] range
	IF const_format == $FF && (const_value < -$100 || const_value > $FF)
		DEF const_format = $FFFF
	ENDC

	IF _NARG >= 3
		DEF const_limit = \3
		; change default $FF const_format to $FFFF if constant limit is outside of [-$100 ; $FF] range
		IF const_format == $FF && (const_limit < -$100 || const_limit > $FF)
			DEF const_format = $FFFF
		ENDC
	ELIF const_inc < 0
		DEF const_limit = const_limit_offset - const_format
	ELSE
		DEF const_limit = const_limit_offset + const_format
	ENDC
ENDM

MACRO? const_def_common_$F
	const_def_common_$7 \#
ENDM
MACRO? const_def_common_$7
	IF _NARG >= 3
		DEF const_limit = \3
	; set constant limit to 0 for negative increment and to const_format for positive
	ELIF const_inc < 0
		DEF const_limit = 0
	ELSE
		DEF const_limit = const_format
	ENDC
ENDM
