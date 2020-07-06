; Enumerate variables

enum_start: MACRO
IF _NARG >= 1
__enum__ = \1
ELSE
__enum__ = 0
ENDC
IF _NARG >= 2
__enumdir__ = \2
ELSE
__enumdir__ = 1
ENDC
ENDM

enum: MACRO
\1 EQU __enum__
__enum__ = __enum__ + __enumdir__
ENDM

enum_set: MACRO
__enum__ = \1
ENDM

; Enumerate constants

const_def: MACRO
IF _NARG >= 1
const_value = \1
ELSE
const_value = 0
ENDC
ENDM

const: MACRO
\1 EQU const_value
const_value = const_value + 1
ENDM

shift_const: MACRO
\1 EQU (1 << const_value)
const_value = const_value + 1
ENDM
