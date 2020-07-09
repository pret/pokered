; Enumerate constants

const_def: MACRO
IF _NARG >= 1
const_value = \1
ELSE
const_value = 0
ENDC
IF _NARG >= 2
const_inc = \2
ELSE
const_inc = 1
ENDC
ENDM

const: MACRO
\1 EQU const_value
const_value = const_value + const_inc
ENDM

shift_const: MACRO
\1 EQU (1 << const_value)
const_value = const_value + const_inc
ENDM

const_skip: MACRO
if _NARG >= 1
const_value = const_value + const_inc * (\1)
else
const_value = const_value + const_inc
endc
ENDM

const_next: MACRO
if (const_value > 0 && \1 < const_value) || (const_value < 0 && \1 > const_value)
fail "const_next cannot go backwards from {const_value} to \1"
else
const_value = \1
endc
ENDM
