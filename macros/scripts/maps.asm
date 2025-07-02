MACRO def_object_events
	REDEF _NUM_OBJECT_EVENTS EQUS "_NUM_OBJECT_EVENTS_\@"
	db {_NUM_OBJECT_EVENTS}
	DEF {_NUM_OBJECT_EVENTS} = 0
ENDM

;\1 x position
;\2 y position
;\3 sprite id
;\4 movement (WALK/STAY)
;\5 range or direction
;\6 text id
;\7 items only: item id
;\7 trainers only: trainer class/pokemon id
;\8 trainers only: trainer number/pokemon level
MACRO object_event
	db \3
	db \2 + 4
	db \1 + 4
	db \4
	db \5
	IF _NARG > 7
		db TRAINER | \6
		db \7
		db \8
	ELIF _NARG > 6
		db ITEM | \6
		db \7
	ELSE
		db \6
	ENDC
	; items and trainers don't use a typical text id
	IF _NARG > 6
		REDEF _OBJECT_EVENT_{d:{_NUM_OBJECT_EVENTS}}_TEXT_ID EQUS "0"
	ELSE
		REDEF _OBJECT_EVENT_{d:{_NUM_OBJECT_EVENTS}}_TEXT_ID EQUS "\6"
	ENDC
	DEF {_NUM_OBJECT_EVENTS} += 1
ENDM

MACRO def_warp_events
	REDEF _NUM_WARP_EVENTS EQUS "_NUM_WARP_EVENTS_\@"
	db {_NUM_WARP_EVENTS}
	DEF {_NUM_WARP_EVENTS} = 0
ENDM

;\1 x position
;\2 y position
;\3 destination map (-1 = wLastMap)
;\4 destination warp id; starts at 1 (internally at 0)
MACRO warp_event
	db \2, \1, \4 - 1, \3
	DEF _WARP_{d:{_NUM_WARP_EVENTS}}_X = \1
	DEF _WARP_{d:{_NUM_WARP_EVENTS}}_Y = \2
	DEF {_NUM_WARP_EVENTS} += 1
ENDM

MACRO def_bg_events
	REDEF _NUM_BG_EVENTS EQUS "_NUM_BG_EVENTS_\@"
	db {_NUM_BG_EVENTS}
	DEF {_NUM_BG_EVENTS} = 0
ENDM

;\1 x position
;\2 y position
;\3 sign id
MACRO bg_event
	db \2, \1, \3
	REDEF _BG_EVENT_{d:{_NUM_BG_EVENTS}}_TEXT_ID EQUS "\3"
	DEF {_NUM_BG_EVENTS} += 1
ENDM

;\1 source map
MACRO def_warps_to
	ASSERT {_NUM_WARP_EVENTS} <= MAX_WARP_EVENTS, \
		"Too many warp_events (above {d:MAX_WARP_EVENTS})!"
	ASSERT {_NUM_BG_EVENTS} <= MAX_BG_EVENTS, \
		"Too many bg_events (above {d:MAX_BG_EVENTS})!"
	ASSERT {_NUM_OBJECT_EVENTS} <= MAX_OBJECT_EVENTS, \
		"Too many object_events (above {d:MAX_OBJECT_EVENTS})!"
	; text ID values are significant (see DisplayTextID in home/text_scripts.asm)
	FOR n, {_NUM_BG_EVENTS}
		ASSERT {_BG_EVENT_{d:n}_TEXT_ID} > {_NUM_OBJECT_EVENTS}, \
			"A bg_event has text ID {_BG_EVENT_{d:n}_TEXT_ID} expected for an object_event ({d:{_NUM_OBJECT_EVENTS}} or below)"
	ENDR
	FOR n, {_NUM_OBJECT_EVENTS}
		ASSERT {_OBJECT_EVENT_{d:n}_TEXT_ID} <= {_NUM_OBJECT_EVENTS}, \
			"An object_event has text ID {_OBJECT_EVENT_{d:n}_TEXT_ID} expected for a bg_event (above {d:{_NUM_OBJECT_EVENTS}})"
	ENDR
	FOR n, {_NUM_WARP_EVENTS}
		warp_to _WARP_{d:n}_X, _WARP_{d:n}_Y, \1_WIDTH
	ENDR
ENDM

;\1 x position
;\2 y position
;\3 map width
MACRO warp_to
	event_displacement \3, \1, \2
ENDM


;\1 first bit offset / first object id
MACRO def_trainers
	IF _NARG == 1
		DEF CURRENT_TRAINER_BIT = \1
	ELSE
		DEF CURRENT_TRAINER_BIT = 1
	ENDC
ENDM

;\1 event flag
;\2 view range
;\3 TextBeforeBattle
;\4 TextEndBattle
;\5 TextAfterBattle
MACRO trainer
	DEF _ev_bit = \1 % 8
	DEF _cur_bit = CURRENT_TRAINER_BIT % 8
	ASSERT _ev_bit == _cur_bit, \
		"Expected \1 to be bit {d:_cur_bit}, got {d:_ev_bit}"
	db CURRENT_TRAINER_BIT
	db \2 << 4
	dw wEventFlags + (\1 - CURRENT_TRAINER_BIT) / 8
	dw \3, \5, \4, \4
	DEF CURRENT_TRAINER_BIT += 1
ENDM

;\1 x position
;\2 y position
;\3 movement data
MACRO map_coord_movement
	dbmapcoord \1, \2
	dw \3
ENDM


;\1 map name
;\2 map id
;\3 tileset
;\4 connections: combo of NORTH, SOUTH, WEST, and/or EAST, or 0 for none
MACRO map_header
	DEF CURRENT_MAP_WIDTH = \2_WIDTH
	DEF CURRENT_MAP_HEIGHT = \2_HEIGHT
	DEF CURRENT_MAP_OBJECT EQUS "\1_Object"
\1_h::
	db \3
	db CURRENT_MAP_HEIGHT, CURRENT_MAP_WIDTH
	dw \1_Blocks
	dw \1_TextPointers
	dw \1_Script
	db \4
ENDM

; Comes after map_header and connection macros
MACRO end_map_header
	dw {CURRENT_MAP_OBJECT}
	PURGE CURRENT_MAP_WIDTH, CURRENT_MAP_HEIGHT, CURRENT_MAP_OBJECT
ENDM

; Connections go in order: north, south, west, east
;\1 direction
;\2 map name
;\3 map id
;\4 offset of the target map relative to the current map
;   (x offset for east/west, y offset for north/south)
MACRO connection

	; Calculate tile offsets for source (current) and target maps
	DEF _src = 0
	DEF _tgt = (\4) + 3
	IF _tgt < 2
		DEF _src = -_tgt
		DEF _tgt = 0
	ENDC

	IF !STRCMP("\1", "north")
		DEF _blk = \3_WIDTH * (\3_HEIGHT - 3) + _src
		DEF _map = _tgt
		DEF _win = (\3_WIDTH + 6) * \3_HEIGHT + 1
		DEF _y = \3_HEIGHT * 2 - 1
		DEF _x = (\4) * -2
		DEF _len = CURRENT_MAP_WIDTH + 3 - (\4)
		IF _len > \3_WIDTH
			DEF _len = \3_WIDTH
		ENDC

	ELIF !STRCMP("\1", "south")
		DEF _blk = _src
		DEF _map = (CURRENT_MAP_WIDTH + 6) * (CURRENT_MAP_HEIGHT + 3) + _tgt
		DEF _win = \3_WIDTH + 7
		DEF _y = 0
		DEF _x = (\4) * -2
		DEF _len = CURRENT_MAP_WIDTH + 3 - (\4)
		IF _len > \3_WIDTH
			DEF _len = \3_WIDTH
		ENDC

	ELIF !STRCMP("\1", "west")
		DEF _blk = (\3_WIDTH * _src) + \3_WIDTH - 3
		DEF _map = (CURRENT_MAP_WIDTH + 6) * _tgt
		DEF _win = (\3_WIDTH + 6) * 2 - 6
		DEF _y = (\4) * -2
		DEF _x = \3_WIDTH * 2 - 1
		DEF _len = CURRENT_MAP_HEIGHT + 3 - (\4)
		IF _len > \3_HEIGHT
			DEF _len = \3_HEIGHT
		ENDC

	ELIF !STRCMP("\1", "east")
		DEF _blk = (\3_WIDTH * _src)
		DEF _map = (CURRENT_MAP_WIDTH + 6) * _tgt + CURRENT_MAP_WIDTH + 3
		DEF _win = \3_WIDTH + 7
		DEF _y = (\4) * -2
		DEF _x = 0
		DEF _len = CURRENT_MAP_HEIGHT + 3 - (\4)
		IF _len > \3_HEIGHT
			DEF _len = \3_HEIGHT
		ENDC

	ELSE
		fail "Invalid direction for 'connection'."
	ENDC

	db \3
	dw \2_Blocks + _blk
	dw wOverworldMap + _map
	db _len - _src
	db \3_WIDTH
	db _y, _x
	dw wOverworldMap + _win
ENDM

MACRO def_script_pointers
	const_def
ENDM

MACRO def_text_pointers
	const_def 1
ENDM

MACRO object_const_def
	const_def 1
ENDM
