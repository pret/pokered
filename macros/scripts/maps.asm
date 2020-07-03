;\1 map width
;\2 Rows above (Y-blocks)
;\3 X movement (X-blocks)
EVENT_DISP: MACRO
	dw (wOverworldMap + 7 + (\1) + ((\1) + 6) * ((\2) >> 1) + ((\3) >> 1)) ; Ev.Disp
	db \2,\3 ;Y,X
ENDM

FLYWARP_DATA: MACRO
	EVENT_DISP \1,\2,\3
	db ((\2) & $01) ;sub-block Y
	db ((\3) & $01) ;sub-block X
ENDM

; external map entry macro
EMAP: MACRO ; emap x-coordinate,y-coordinate,textpointer
; the appearance of towns and routes in the town map, indexed by map id
	; nybble: y-coordinate
	; nybble: x-coordinate
	; word  : pointer to map name
	dn \2, \1
	dw \3
ENDM

; internal map entry macro
IMAP: MACRO ; imap mapid_less_than,x-coordinate,y-coordinate,textpointer
; the appearance of buildings and dungeons in the town map
	; byte  : maximum map id subject to this rule
	; nybble: y-coordinate
	; nybble: x-coordinate
	; word  : pointer to map name
	db \1 + 1
	dn \3, \2
	dw \4
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
	IF (_NARG > 7)
		db TRAINER | \6
		db \7
		db \8
	ELSE
		IF (_NARG > 6)
			db ITEM | \6
			db \7
		ELSE
			db \6
		ENDC
	ENDC
ENDM

;\1 x position
;\2 y position
;\3 destination warp id
;\4 destination map (-1 = wLastMap)
warp: MACRO
	db \2, \1, \3, \4
ENDM

;\1 x position
;\2 y position
;\3 sign id
sign: MACRO
	db \2, \1, \3
ENDM

;\1 x position
;\2 y position
;\3 map width
warp_to: MACRO
	EVENT_DISP \3, \2, \1
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
	dw CURRENT_MAP_OBJECT
PURGE CURRENT_MAP_WIDTH
PURGE CURRENT_MAP_HEIGHT
PURGE CURRENT_MAP_OBJECT
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
if _tgt < 2
_src = -_tgt
_tgt = 0
endc

if "\1" == "north"
_blk = \3_WIDTH * (\3_HEIGHT - 3) + _src
_map = _tgt
_win = (\3_WIDTH + 6) * \3_HEIGHT + 1
_y = \3_HEIGHT * 2 - 1
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc

elif "\1" == "south"
_blk = _src
_map = (CURRENT_MAP_WIDTH + 6) * (CURRENT_MAP_HEIGHT + 3) + _tgt
_win = \3_WIDTH + 7
_y = 0
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc

elif "\1" == "west"
_blk = (\3_WIDTH * _src) + \3_WIDTH - 3
_map = (CURRENT_MAP_WIDTH + 6) * _tgt
_win = (\3_WIDTH + 6) * 2 - 6
_y = (\4) * -2
_x = \3_WIDTH * 2 - 1
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc

elif "\1" == "east"
_blk = (\3_WIDTH * _src)
_map = (CURRENT_MAP_WIDTH + 6) * _tgt + CURRENT_MAP_WIDTH + 3
_win = \3_WIDTH + 7
_y = (\4) * -2
_x = 0
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc

else
fail "Invalid direction for 'connection'."
endc

	db \3
	dw \2_Blocks + _blk
	dw wOverworldMap + _map
	db _len - _src
	db \3_WIDTH
	db _y, _x
	dw wOverworldMap + _win
ENDM
