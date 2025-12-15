; Macros to verify assumptions about the data or code

MACRO? _redef_current_label
	IF DEF(\1)
		PURGE \1
	ENDC
	IF _NARG > 2
		DEF \1 EQUS "\3"
	ELIF STRLEN(#__SCOPE__)
		IF {{__SCOPE__}} - @ == 0
			DEF \1 EQUS #{__SCOPE__}
		ENDC
	ENDC
	if !DEF(\1)
		DEF \1 EQUS \2
		{\1}:
	ENDC
ENDM

MACRO? table_width
	DEF CURRENT_TABLE_WIDTH = \1
	SHIFT
	_redef_current_label CURRENT_TABLE_START, "._table_width\@", \#
ENDM

MACRO? assert_table_length
	DEF w = \1
	DEF x = w * CURRENT_TABLE_WIDTH
	DEF y = @ - {CURRENT_TABLE_START}
	ASSERT x == y, "{CURRENT_TABLE_START}: expected {d:w} entries, each {d:CURRENT_TABLE_WIDTH} " ++ \
		"bytes, for {d:x} total; but got {d:y} bytes"
ENDM

MACRO? assert_max_table_length
	DEF w = \1
	DEF x = w * CURRENT_TABLE_WIDTH
	DEF y = @ - {CURRENT_TABLE_START}
	ASSERT x >= y, "{CURRENT_TABLE_START}: expected a maximum of {d:w} entries, each " ++ \
		"{d:CURRENT_TABLE_WIDTH} bytes, for maximum {d:x} total; but got {d:y} bytes"
ENDM

MACRO? list_start
	DEF list_index = 0
	DEF list_item_length = 0
	IF _NARG > 0
		DEF list_item_length = \1
		SHIFT
	ENDC
	_redef_current_label CURRENT_LIST_START, "._list_start\@", \#
ENDM

MACRO? li
	ASSERT STRFIND(\1, "@") == -1, "String terminator \"@\" in list entry: \1"
	IF list_item_length
		ASSERT CHARLEN(\1) <= list_item_length, \
			"List entry longer than {d:list_item_length} characters: \1"
	ENDC
	db \1, "@"
	DEF list_index += 1
ENDM

MACRO? assert_list_length
	DEF x = \1
	ASSERT x == list_index, \
		"{CURRENT_LIST_START}: expected {d:x} entries, got {d:list_index}"
ENDM

MACRO? nybble_array
	DEF CURRENT_NYBBLE_ARRAY_VALUE = 0
	DEF CURRENT_NYBBLE_ARRAY_LENGTH = 0
	IF _NARG == 1
		REDEF CURRENT_NYBBLE_ARRAY_START EQUS "\1"
	ELSE
		REDEF CURRENT_NYBBLE_ARRAY_START EQUS "._nybble_array\@"
	{CURRENT_NYBBLE_ARRAY_START}:
	ENDC
ENDM

MACRO? nybble
	ASSERT 0 <= (\1) && (\1) < $10, "nybbles must be 0-15"
	DEF CURRENT_NYBBLE_ARRAY_VALUE = (\1) | (CURRENT_NYBBLE_ARRAY_VALUE << 4)
	DEF CURRENT_NYBBLE_ARRAY_LENGTH += 1
	IF CURRENT_NYBBLE_ARRAY_LENGTH % 2 == 0
		db CURRENT_NYBBLE_ARRAY_VALUE
		DEF CURRENT_NYBBLE_ARRAY_VALUE = 0
	ENDC
ENDM

MACRO? end_nybble_array
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

MACRO? bit_array
	DEF CURRENT_BIT_ARRAY_VALUE = 0
	DEF CURRENT_BIT_ARRAY_LENGTH = 0
	IF _NARG == 1
		REDEF CURRENT_BIT_ARRAY_START EQUS "\1"
	ELSE
		REDEF CURRENT_BIT_ARRAY_START EQUS "._bit_array\@"
	{CURRENT_BIT_ARRAY_START}:
	ENDC
ENDM

MACRO? dbit
	ASSERT (\1) == 0 || (\1) == 1, "bits must be 0 or 1"
	DEF CURRENT_BIT_ARRAY_VALUE |= (\1) << (CURRENT_BIT_ARRAY_LENGTH % 8)
	DEF CURRENT_BIT_ARRAY_LENGTH += 1
	IF CURRENT_BIT_ARRAY_LENGTH % 8 == 0
		db CURRENT_BIT_ARRAY_VALUE
		DEF CURRENT_BIT_ARRAY_VALUE = 0
	ENDC
ENDM

MACRO? end_bit_array
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

MACRO? def_grass_wildmons
;\1: encounter rate
	DEF CURRENT_GRASS_WILDMONS_RATE = \1
	REDEF CURRENT_GRASS_WILDMONS_LABEL EQUS "._def_grass_wildmons_\1"
{CURRENT_GRASS_WILDMONS_LABEL}:
	db \1
ENDM

MACRO? end_grass_wildmons
	DEF x = @ - {CURRENT_GRASS_WILDMONS_LABEL}
	IF CURRENT_GRASS_WILDMONS_RATE == 0
		ASSERT 1 == x, \
			"def_grass_wildmons {d:CURRENT_GRASS_WILDMONS_RATE}: expected 1 byte, got {d:x}"
	ELSE
		ASSERT WILDDATA_LENGTH == x, \
			"def_grass_wildmons {d:CURRENT_GRASS_WILDMONS_RATE}: expected {d:WILDDATA_LENGTH} bytes, got {d:x}"
	ENDC
ENDM

MACRO? def_water_wildmons
;\1: encounter rate
	DEF CURRENT_WATER_WILDMONS_RATE = \1
	REDEF CURRENT_WATER_WILDMONS_LABEL EQUS "._def_water_wildmons_\1"
{CURRENT_WATER_WILDMONS_LABEL}:
	db \1
ENDM

MACRO? end_water_wildmons
	DEF x = @ - {CURRENT_WATER_WILDMONS_LABEL}
	IF CURRENT_WATER_WILDMONS_RATE == 0
		ASSERT 1 == x, \
			"def_water_wildmons {d:CURRENT_WATER_WILDMONS_RATE}: expected 1 byte, got {d:x}"
	ELSE
		ASSERT WILDDATA_LENGTH == x, \
			"def_water_wildmons {d:CURRENT_WATER_WILDMONS_RATE}: expected {d:WILDDATA_LENGTH} bytes, got {d:x}"
	ENDC
ENDM
