def_objects: MACRO
REDEF _NUM_OBJECTS EQUS "_NUM_OBJECTS_\@"
	db {_NUM_OBJECTS}
{_NUM_OBJECTS} = 0
ENDM

;\1 sprite id
;\2 x position
;\3 y position
;\4 movement (WALK/STAY)
;\5 range or direction
;\6 text id
;\7 items only: item id
;\7 trainers only: trainer class/pokemon id
;\8 trainers only: trainer number/pokemon level
object: MACRO
	db \1
	db \3 + 4
	db \2 + 4
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
{_NUM_OBJECTS} = {_NUM_OBJECTS} + 1
ENDM

def_warps: MACRO
REDEF _NUM_WARPS EQUS "_NUM_WARPS_\@"
	db {_NUM_WARPS}
{_NUM_WARPS} = 0
ENDM

;\1 x position
;\2 y position
;\3 destination warp id
;\4 destination map (-1 = wLastMap)
warp: MACRO
	db \2, \1, \3, \4
_WARP_{d:{_NUM_WARPS}}_X = \1
_WARP_{d:{_NUM_WARPS}}_Y = \2
{_NUM_WARPS} = {_NUM_WARPS} + 1
ENDM

def_signs: MACRO
REDEF _NUM_SIGNS EQUS "_NUM_SIGNS_\@"
	db {_NUM_SIGNS}
{_NUM_SIGNS} = 0
ENDM

;\1 x position
;\2 y position
;\3 sign id
sign: MACRO
	db \2, \1, \3
{_NUM_SIGNS} = {_NUM_SIGNS} + 1
ENDM

;\1 source map
def_warps_to: MACRO
	FOR n, _NUM_WARPS
		warp_to _WARP_{d:n}_X, _WARP_{d:n}_Y, \1_WIDTH
	ENDR
ENDM

;\1 x position
;\2 y position
;\3 map width
warp_to: MACRO
	event_displacement \3, \1, \2
ENDM


;\1 first bit offset / first object id
def_trainers: MACRO
IF _NARG == 1
CURRENT_TRAINER_BIT = \1
ELSE
CURRENT_TRAINER_BIT = 1
ENDC
ENDM

;\1 event flag
;\2 view range
;\3 TextBeforeBattle
;\4 TextAfterBattle
;\5 TextEndBattle
trainer: MACRO
_ev_bit = \1 % 8
_cur_bit = CURRENT_TRAINER_BIT % 8
	ASSERT _ev_bit == _cur_bit, \
		"Expected \1 to be bit {d:_cur_bit}, got {d:_ev_bit}"
	db CURRENT_TRAINER_BIT
	db \2 << 4
	dw wEventFlags + (\1 - CURRENT_TRAINER_BIT) / 8
	dw \3, \5, \4, \4
CURRENT_TRAINER_BIT = CURRENT_TRAINER_BIT + 1
ENDM

;\1 x position
;\2 y position
;\3 movement data
map_coord_movement: MACRO
	dbmapcoord \1, \2
	dw \3
ENDM


;\1 map name
;\2 map id
;\3 tileset
;\4 connections: combo of NORTH, SOUTH, WEST, and/or EAST, or 0 for none
map_header: MACRO
CURRENT_MAP_WIDTH = \2_WIDTH
CURRENT_MAP_HEIGHT = \2_HEIGHT
CURRENT_MAP_OBJECT EQUS "\1_Object"
\1_h::
	db \3
	db CURRENT_MAP_HEIGHT, CURRENT_MAP_WIDTH
	dw \1_Blocks
	dw \1_TextPointers
	dw \1_Script
	db \4
ENDM

; Comes after map_header and connection macros
end_map_header: MACRO
	dw {CURRENT_MAP_OBJECT}
	PURGE CURRENT_MAP_WIDTH, CURRENT_MAP_HEIGHT, CURRENT_MAP_OBJECT
ENDM

; Connections go in order: north, south, west, east
;\1 direction
;\2 map name
;\3 map id
;\4 offset of the target map relative to the current map
;   (x offset for east/west, y offset for north/south)
connection: MACRO

; Calculate tile offsets for source (current) and target maps
_src = 0
_tgt = (\4) + 3
IF _tgt < 2
_src = -_tgt
_tgt = 0
ENDC

IF !STRCMP("\1", "north")
_blk = \3_WIDTH * (\3_HEIGHT - 3) + _src
_map = _tgt
_win = (\3_WIDTH + 6) * \3_HEIGHT + 1
_y = \3_HEIGHT * 2 - 1
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
IF _len > \3_WIDTH
_len = \3_WIDTH
ENDC

ELIF !STRCMP("\1", "south")
_blk = _src
_map = (CURRENT_MAP_WIDTH + 6) * (CURRENT_MAP_HEIGHT + 3) + _tgt
_win = \3_WIDTH + 7
_y = 0
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
IF _len > \3_WIDTH
_len = \3_WIDTH
ENDC

ELIF !STRCMP("\1", "west")
_blk = (\3_WIDTH * _src) + \3_WIDTH - 3
_map = (CURRENT_MAP_WIDTH + 6) * _tgt
_win = (\3_WIDTH + 6) * 2 - 6
_y = (\4) * -2
_x = \3_WIDTH * 2 - 1
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
IF _len > \3_HEIGHT
_len = \3_HEIGHT
ENDC

ELIF !STRCMP("\1", "east")
_blk = (\3_WIDTH * _src)
_map = (CURRENT_MAP_WIDTH + 6) * _tgt + CURRENT_MAP_WIDTH + 3
_win = \3_WIDTH + 7
_y = (\4) * -2
_x = 0
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
IF _len > \3_HEIGHT
_len = \3_HEIGHT
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
