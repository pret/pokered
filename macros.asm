
text   EQUS "db $00," ; Start writing text.
next   EQUS "db $4e," ; Move a line down.
line   EQUS "db $4f," ; Start writing at the bottom line.
para   EQUS "db $51," ; Start a new paragraph.
cont   EQUS "db $55," ; Scroll to the next line.
done   EQUS "db $57"  ; End a text box.
prompt EQUS "db $58"  ; Prompt the player to end a text box (initiating some other event).

page   EQUS "db $49,"     ; Start a new Pokedex page.
dex    EQUS "db $5f, $50" ; End a Pokedex entry.


percent EQUS "* $ff / 100"

lb: MACRO ; r, hi, lo
	ld \1, (\2) << 8 + ((\3) & $ff)
	ENDM


; Constant enumeration is useful for monsters, items, moves, etc.
const_def: MACRO
const_value = 0
ENDM

const: MACRO
\1 EQU const_value
const_value = const_value + 1
ENDM


homecall: MACRO
	ld a, [H_LOADEDROMBANK]
	push af
	ld a, BANK(\1)
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a
	call \1
	pop af
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a
	ENDM

callba: MACRO
	ld b, BANK(\1)
	ld hl, \1
	call Bankswitch
	ENDM

callab: MACRO
	ld hl, \1
	ld b, BANK(\1)
	call Bankswitch
	ENDM

jpba: MACRO
	ld b, BANK(\1)
	ld hl, \1
	jp Bankswitch
	ENDM

jpab: MACRO
	ld hl, \1
	ld b, BANK(\1)
	jp Bankswitch
	ENDM

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

;\1 = r
;\2 = X
;\3 = Y
coord: MACRO
	ld \1, wTileMap + 20 * \3 + \2
	ENDM

;\1 = X
;\2 = Y
aCoord: MACRO
	ld a, [wTileMap + 20 * \2 + \1]
	ENDM

;\1 = X
;\2 = Y
Coorda: MACRO
	ld [wTileMap + 20 * \2 + \1], a
	ENDM

;\1 = X
;\2 = Y
dwCoord: MACRO
	dw wTileMap + 20 * \2 + \1
	ENDM

;\1 = r
;\2 = X
;\3 = Y
;\4 = map width
overworldMapCoord: MACRO
	ld \1, wOverworldMap + ((\2) + 3) + (((\3) + 3) * ((\4) + (3 * 2)))
	ENDM

;\1 = Map Width
;\2 = Rows above (Y-blocks)
;\3 = X movement (X-blocks)
EVENT_DISP: MACRO
	dw (wOverworldMap + 7 + (\1) + ((\1) + 6) * ((\2) >> 1) + ((\3) >> 1)) ; Ev.Disp
	db \2,\3	;Y,X
	ENDM

FLYWARP_DATA: MACRO
	EVENT_DISP \1,\2,\3
	db ((\2) & $01)	;sub-block Y
	db ((\3) & $01)	;sub-block X
	ENDM

; external map entry macro
EMAP: MACRO ; emap x-coordinate,y-coordinate,textpointer
; the appearance of towns and routes in the town map, indexed by map id
	; nybble: y-coordinate
	; nybble: x-coordinate
	; word  : pointer to map name
	db (\1 + (\2 << 4))
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
	db \2 + \3 << 4
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

; macro for two nibbles
dn: MACRO
	db (\1 << 4 | \2)
	ENDM

; macro for putting a byte then a word
dbw: MACRO
	db \1
	dw \2
	ENDM

; data format macros
RGB: MACRO
	dw (\3 << 10 | \2 << 5 | \1)
	ENDM

; text macros
TX_NUM: MACRO
; print a big-endian decimal number.
; \1: address to read from
; \2: number of bytes to read
; \3: number of digits to display
	db $09
	dw \1
	db \2 << 4 | \3
	ENDM

TX_FAR: MACRO
	db $17
	dw \1
	db BANK(\1)
	ENDM

; text engine command $1
TX_RAM: MACRO
; prints text to screen
; \1: RAM address to read from
	db $1
	dw \1
	ENDM

TX_BCD: MACRO
	db $2
	dw \1
	db \2
	ENDM

TX_ASM: MACRO
	db $08
	ENDM

; Predef macro.
add_predef: MACRO
\1Predef::
	db BANK(\1)
	dw \1
	ENDM

predef_id: MACRO
	ld a, (\1Predef - PredefPointers) / 3
	ENDM

predef: MACRO
	predef_id \1
	call Predef
	ENDM

predef_jump: MACRO
	predef_id \1
	jp Predef
	ENDM


add_tx_pre: MACRO
\1_id:: dw \1
ENDM

tx_pre_id: MACRO
	ld a, (\1_id - TextPredefs) / 2 + 1
ENDM

tx_pre: MACRO
	tx_pre_id \1
	call PrintPredefTextID
ENDM

tx_pre_jump: MACRO
	tx_pre_id \1
	jp PrintPredefTextID
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


;1_channel	EQU $00
;2_channels	EQU $40
;3_channels	EQU $80
;4_channels	EQU $C0

CH0		EQU 0
CH1		EQU 1
CH2		EQU 2
CH3		EQU 3
CH4		EQU 4
CH5		EQU 5
CH6		EQU 6
CH7		EQU 7

unknownsfx0x10: MACRO
	db $10
	db \1
ENDM

unknownsfx0x20: MACRO
	db $20 | \1
	db \2
	db \3
	db \4
ENDM

unknownnoise0x20: MACRO
	db $20 | \1
	db \2
	db \3
ENDM

;format: pitch length (in 16ths)
C_: MACRO
	db $00 | (\1 - 1)
ENDM

C#: MACRO
	db $10 | (\1 - 1)
ENDM

D_: MACRO
	db $20 | (\1 - 1)
ENDM

D#: MACRO
	db $30 | (\1 - 1)
ENDM

E_: MACRO
	db $40 | (\1 - 1)
ENDM

F_: MACRO
	db $50 | (\1 - 1)
ENDM

F#: MACRO
	db $60 | (\1 - 1)
ENDM

G_: MACRO
	db $70 | (\1 - 1)
ENDM

G#: MACRO
	db $80 | (\1 - 1)
ENDM

A_: MACRO
	db $90 | (\1 - 1)
ENDM

A#: MACRO
	db $A0 | (\1 - 1)
ENDM

B_: MACRO
	db $B0 | (\1 - 1)
ENDM

;format: instrument length (in 16ths)
snare1: MACRO
	db $B0 | (\1 - 1)
	db $01
ENDM

snare2: MACRO
	db $B0 | (\1 - 1)
	db $02
ENDM

snare3: MACRO
	db $B0 | (\1 - 1)
	db $03
ENDM

snare4: MACRO
	db $B0 | (\1 - 1)
	db $04
ENDM

snare5: MACRO
	db $B0 | (\1 - 1)
	db $05
ENDM

triangle1: MACRO
	db $B0 | (\1 - 1)
	db $06
ENDM

triangle2: MACRO
	db $B0 | (\1 - 1)
	db $07
ENDM

snare6: MACRO
	db $B0 | (\1 - 1)
	db $08
ENDM

snare7: MACRO
	db $B0 | (\1 - 1)
	db $09
ENDM

snare8: MACRO
	db $B0 | (\1 - 1)
	db $0A
ENDM

snare9: MACRO
	db $B0 | (\1 - 1)
	db $0B
ENDM

cymbal1: MACRO
	db $B0 | (\1 - 1)
	db $0C
ENDM

cymbal2: MACRO
	db $B0 | (\1 - 1)
	db $0D
ENDM

cymbal3: MACRO
	db $B0 | (\1 - 1)
	db $0E
ENDM

mutedsnare1: MACRO
	db $B0 | (\1 - 1)
	db $0F
ENDM

triangle3: MACRO
	db $B0 | (\1 - 1)
	db $10
ENDM

mutedsnare2: MACRO
	db $B0 | (\1 - 1)
	db $11
ENDM

mutedsnare3: MACRO
	db $B0 | (\1 - 1)
	db $12
ENDM

mutedsnare4: MACRO
	db $B0 | (\1 - 1)
	db $13
ENDM

;format: rest length (in 16ths)
rest: MACRO
	db $C0 | (\1 - 1)
ENDM

; format: notetype speed, volume, fade
notetype: MACRO
	db	$D0 | \1
	db	(\2 << 4) | \3
ENDM

dspeed: MACRO
	db $D0 | \1
ENDM

octave: MACRO
	db $E8 - \1
ENDM

toggleperfectpitch: MACRO
	db $E8
ENDM

;format: vibrato delay, rate, depth
vibrato: MACRO
	db $EA
	db \1
	db (\2 << 4) | \3
ENDM

pitchbend: MACRO
	db $EB
	db \1
	db \2
ENDM

duty: MACRO
	db $EC
	db \1
ENDM

tempo: MACRO
	db $ED
	db \1 / $100
	db \1 % $100
ENDM

stereopanning: MACRO
	db $EE
	db \1
ENDM

volume: MACRO
	db $F0
	db (\1 << 4) | \2
ENDM

executemusic: MACRO
	db $F8
ENDM

dutycycle: MACRO
	db $FC
	db \1
ENDM

;format: callchannel address
callchannel: MACRO
	db $FD
	dw \1
ENDM

;format: loopchannel count, address
loopchannel: MACRO
	db $FE
	db \1
	dw \2
ENDM

endchannel: MACRO
	db $FF
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
	dw \5 + \4 ; "Conection Strip" location
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
	rept _NARG
if \1 != 0
x = x | (1 << ((\1 - 1) % 8))
endc
	shift
	endr
	db x
ENDM
