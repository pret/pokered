; Macros to verify assumptions about the data or code

MACRO _redef_current_label
	IF DEF(\1)
		PURGE \1
	ENDC
	IF _NARG == 3 + (\3)
		DEF \1 EQUS "\<_NARG>"
	ELIF DEF(..)
		IF .. - @ == 0
			DEF \1 EQUS "{..}"
		ENDC
	ELIF DEF(.)
		if . - @ == 0
			DEF \1 EQUS "{.}"
		ENDC
	ENDC
	if !DEF(\1)
		DEF \1 EQUS \2
		{\1}:
	ENDC
ENDM

MACRO table_width
	DEF CURRENT_TABLE_WIDTH = \1
	_redef_current_label CURRENT_TABLE_START, "._table_width\@", 2, \#
ENDM

MACRO assert_table_length
	DEF x = \1
	ASSERT x * CURRENT_TABLE_WIDTH == @ - {CURRENT_TABLE_START}, \
		"{CURRENT_TABLE_START}: expected {d:x} entries, each {d:CURRENT_TABLE_WIDTH} bytes"
ENDM

MACRO assert_max_table_length
	DEF x = \1
	ASSERT x * CURRENT_TABLE_WIDTH >= @ - {CURRENT_TABLE_START}, \
		"{CURRENT_TABLE_START}: expected a maximum of {d:x} entries, each {d:CURRENT_TABLE_WIDTH} bytes"
ENDM

MACRO list_start
	DEF list_index = 0
	_redef_current_label CURRENT_LIST_START, "._list_start\@", 1, \#
ENDM

MACRO li
	ASSERT STRFIND(\1, "@") == -1, "String terminator \"@\" in list entry: \1"
	db \1, "@"
	DEF list_index += 1
ENDM

MACRO assert_list_length
	DEF x = \1
	ASSERT x == list_index, \
		"{CURRENT_LIST_START}: expected {d:x} entries, got {d:list_index}"
ENDM

MACRO nybble_array
	DEF CURRENT_NYBBLE_ARRAY_VALUE = 0
	DEF CURRENT_NYBBLE_ARRAY_LENGTH = 0
	IF _NARG == 1
		REDEF CURRENT_NYBBLE_ARRAY_START EQUS "\1"
	ELSE
		REDEF CURRENT_NYBBLE_ARRAY_START EQUS "._nybble_array\@"
	{CURRENT_NYBBLE_ARRAY_START}:
	ENDC
ENDM

MACRO nybble
	ASSERT 0 <= (\1) && (\1) < $10, "nybbles must be 0-15"
	DEF CURRENT_NYBBLE_ARRAY_VALUE = (\1) | (CURRENT_NYBBLE_ARRAY_VALUE << 4)
	DEF CURRENT_NYBBLE_ARRAY_LENGTH += 1
	IF CURRENT_NYBBLE_ARRAY_LENGTH % 2 == 0
		db CURRENT_NYBBLE_ARRAY_VALUE
		DEF CURRENT_NYBBLE_ARRAY_VALUE = 0
	ENDC
ENDM

MACRO end_nybble_array
	IF CURRENT_NYBBLE_ARRAY_LENGTH % 2
		db CURRENT_NYBBLE_ARRAY_VALUE << 4
	ENDC
	IF _NARG == 1
		DEF x = \1
		ASSERT x == CURRENT_NYBBLE_ARRAY_LENGTH, \
			"{CURRENT_NYBBLE_ARRAY_START}: expected {d:x} nybbles, got {d:CURRENT_NYBBLE_ARRAY_LENGTH}"
		DEF x = (x + 1) / 2
		ASSERT x == @ - {CURRENT_NYBBLE_ARRAY_START}, \
			"{CURRENT_NYBBLE_ARRAY_START}: expected {d:x} bytes"
	ENDC
ENDM

MACRO bit_array
	DEF CURRENT_BIT_ARRAY_VALUE = 0
	DEF CURRENT_BIT_ARRAY_LENGTH = 0
	IF _NARG == 1
		REDEF CURRENT_BIT_ARRAY_START EQUS "\1"
	ELSE
		REDEF CURRENT_BIT_ARRAY_START EQUS "._bit_array\@"
	{CURRENT_BIT_ARRAY_START}:
	ENDC
ENDM

MACRO dbit
	ASSERT (\1) == 0 || (\1) == 1, "bits must be 0 or 1"
	DEF CURRENT_BIT_ARRAY_VALUE |= (\1) << (CURRENT_BIT_ARRAY_LENGTH % 8)
	DEF CURRENT_BIT_ARRAY_LENGTH += 1
	IF CURRENT_BIT_ARRAY_LENGTH % 8 == 0
		db CURRENT_BIT_ARRAY_VALUE
		DEF CURRENT_BIT_ARRAY_VALUE = 0
	ENDC
ENDM

MACRO end_bit_array
	IF CURRENT_BIT_ARRAY_LENGTH % 8
		db CURRENT_BIT_ARRAY_VALUE
	ENDC
	IF _NARG == 1
		DEF x = \1
		ASSERT x == CURRENT_BIT_ARRAY_LENGTH, \
			"{CURRENT_BIT_ARRAY_START}: expected {d:x} bits, got {d:CURRENT_BIT_ARRAY_LENGTH}"
		DEF x = (x + 7) / 8
		ASSERT x == @ - {CURRENT_BIT_ARRAY_START}, \
			"{CURRENT_BIT_ARRAY_START}: expected {d:x} bytes"
	ENDC
ENDM

MACRO def_grass_wildmons
;\1: encounter rate
	DEF CURRENT_GRASS_WILDMONS_RATE = \1
	REDEF CURRENT_GRASS_WILDMONS_LABEL EQUS "._def_grass_wildmons_\1"
{CURRENT_GRASS_WILDMONS_LABEL}:
	db \1
ENDM

MACRO end_grass_wildmons
	IF CURRENT_GRASS_WILDMONS_RATE == 0
		ASSERT 1 == @ - {CURRENT_GRASS_WILDMONS_LABEL}, \
			"def_grass_wildmons {d:CURRENT_GRASS_WILDMONS_RATE}: expected 1 byte"
	ELSE
		ASSERT WILDDATA_LENGTH == @ - {CURRENT_GRASS_WILDMONS_LABEL}, \
			"def_grass_wildmons {d:CURRENT_GRASS_WILDMONS_RATE}: expected {d:WILDDATA_LENGTH} bytes"
	ENDC
ENDM

MACRO def_water_wildmons
;\1: encounter rate
	DEF CURRENT_WATER_WILDMONS_RATE = \1
	REDEF CURRENT_WATER_WILDMONS_LABEL EQUS "._def_water_wildmons_\1"
{CURRENT_WATER_WILDMONS_LABEL}:
	db \1
ENDM

MACRO end_water_wildmons
	IF CURRENT_WATER_WILDMONS_RATE == 0
		ASSERT 1 == @ - {CURRENT_WATER_WILDMONS_LABEL}, \
			"def_water_wildmons {d:CURRENT_WATER_WILDMONS_RATE}: expected 1 byte"
	ELSE
		ASSERT WILDDATA_LENGTH == @ - {CURRENT_WATER_WILDMONS_LABEL}, \
			"def_water_wildmons {d:CURRENT_WATER_WILDMONS_RATE}: expected {d:WILDDATA_LENGTH} bytes"
	ENDC
ENDM
