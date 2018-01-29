
; Constant enumeration is useful for monsters, items, moves, etc.
const_def: MACRO
const_value = 0
ENDM

const: MACRO
\1 EQU const_value
const_value = const_value + 1
ENDM

; data format macros

percent EQUS "* $ff / 100"

bcd2: MACRO
	dn ((\1) / 1000) % 10, ((\1) / 100) % 10
	dn ((\1) / 10) % 10, (\1) % 10
ENDM

bcd3: MACRO
	dn ((\1) / 100000) % 10, ((\1) / 10000) % 10
	dn ((\1) / 1000) % 10, ((\1) / 100) % 10
	dn ((\1) / 10) % 10, (\1) % 10
ENDM

coins equs "bcd2"
money equs "bcd3"

;\1 = Map Width
;\2 = Rows above (Y-blocks)
;\3 = X movement (X-blocks)
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

; tilesets' headers macro
tileset: MACRO
	db BANK(\2)   ; BANK(GFX)
	dw \1, \2, \3 ; Block, GFX, Coll
	db \4, \5, \6 ; counter tiles
	db \7         ; grass tile
	db \8         ; permission (indoor, cave, outdoor)
ENDM

INDOOR  EQU 0
CAVE    EQU 1
OUTDOOR EQU 2

RGB: MACRO
	dw (\3 << 10 | \2 << 5 | \1)
ENDM

WALK EQU $FE
STAY EQU $FF

DOWN  EQU $D0
UP    EQU $D1
LEFT  EQU $D2
RIGHT EQU $D3
NONE  EQU $FF

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
;\4 destination map ($ff = wLastMap)
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

;\1 (byte) = current map id
;\2 (byte) = connected map id
;\3 (byte) = x movement of connection strip
;\4 (byte) = connection strip offset
;\5 (word) = connected map blocks pointer
NORTH_MAP_CONNECTION: MACRO
	db \2 ; map id
	dw \5 + (\2_WIDTH * (\2_HEIGHT - 3)) + \4; "Connection Strip" location
	dw wOverworldMap + 3 + \3 ; current map position
	IF (\1_WIDTH < \2_WIDTH)
		db \1_WIDTH - \3 + 3 ; width of connection strip
	ELSE
		db \2_WIDTH - \4 ; width of connection strip
	ENDC
	db \2_WIDTH ; map width
	db (\2_HEIGHT * 2) - 1 ; y alignment (y coordinate of player when entering map)
	db (\3 - \4) * -2 ; x alignment (x coordinate of player when entering map)
	dw wOverworldMap + 1 + (\2_HEIGHT * (\2_WIDTH + 6)) ; window (position of the upper left block after entering the map)
ENDM

;\1 (byte) = current map id
;\2 (byte) = connected map id
;\3 (byte) = x movement of connection strip
;\4 (byte) = connection strip offset
;\5 (word) = connected map blocks pointer
;\6 (flag) = add 3 to width of connection strip (why?)
SOUTH_MAP_CONNECTION: MACRO
	db \2 ; map id
	dw \5 + \4 ; "Connection Strip" location
	dw wOverworldMap + 3 + (\1_HEIGHT + 3) * (\1_WIDTH + 6) + \3 ; current map position
	IF (\1_WIDTH < \2_WIDTH)
		IF (_NARG > 5)
			db \1_WIDTH - \3 + 3 ; width of connection strip
		ELSE
			db \1_WIDTH - \3 ; width of connection strip
		ENDC
	ELSE
		db \2_WIDTH - \4 ; width of connection strip
	ENDC
	db \2_WIDTH ; map width
	db 0  ; y alignment (y coordinate of player when entering map)
	db (\3 - \4) * -2 ; x alignment (x coordinate of player when entering map)
	dw wOverworldMap + 7 + \2_WIDTH ; window (position of the upper left block after entering the map)
ENDM

;\1 (byte) = current map id
;\2 (byte) = connected map id
;\3 (byte) = y movement of connection strip
;\4 (byte) = connection strip offset
;\5 (word) = connected map blocks pointer
WEST_MAP_CONNECTION: MACRO
	db \2 ; map id
	dw \5 + (\2_WIDTH * \4) + \2_WIDTH - 3 ; "Connection Strip" location
	dw wOverworldMap + (\1_WIDTH + 6) * (\3 + 3) ; current map position
	IF (\1_HEIGHT < \2_HEIGHT)
		db \1_HEIGHT - \3 + 3 ; height of connection strip
	ELSE
		db \2_HEIGHT - \4 ; height of connection strip
	ENDC
	db \2_WIDTH ; map width
	db (\3 - \4) * -2 ; y alignment
	db (\2_WIDTH * 2) - 1 ; x alignment
	dw wOverworldMap + 6 + (2 * \2_WIDTH) ; window (position of the upper left block after entering the map)
ENDM

;\1 (byte) = current map id
;\2 (byte) = connected map id
;\3 (byte) = y movement of connection strip
;\4 (byte) = connection strip offset
;\5 (word) = connected map blocks pointer
;\6 (flag) = add 3 to height of connection strip (why?)
EAST_MAP_CONNECTION: MACRO
	db \2 ; map id
	dw \5 + (\2_WIDTH * \4) ; "Connection Strip" location
	dw wOverworldMap - 3 + (\1_WIDTH + 6) * (\3 + 4) ; current map position
	IF (\1_HEIGHT < \2_HEIGHT)
		IF (_NARG > 5)
			db \1_HEIGHT - \3 + 3 ; height of connection strip
		ELSE
			db \1_HEIGHT - \3 ; height of connection strip
		ENDC
	ELSE
		db \2_HEIGHT - \4 ; height of connection strip
	ENDC
	db \2_WIDTH ; map width
	db (\3 - \4) * -2 ; y alignment
	db 0 ; x alignment
	dw wOverworldMap + 7 + \2_WIDTH ; window (position of the upper left block after entering the map)
ENDM

tmlearn: MACRO
x = 0
	REPT _NARG
IF \1 != 0
x = x | (1 << ((\1 - 1) % 8))
ENDC
	SHIFT
	ENDR
	db x
ENDM
