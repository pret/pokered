
lb: MACRO ; r, hi, lo
	ld \1, (\2) << 8 + ((\3) & $ff)
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

farcall EQUS "callba"

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

validateCoords: MACRO
	IF \1 >= SCREEN_WIDTH
		fail "x coord out of range"
	ENDC
	IF \2 >= SCREEN_HEIGHT
		fail "y coord out of range"
	ENDC
ENDM

;\1 = r
;\2 = X
;\3 = Y
;\4 = which tilemap (optional)
coord: MACRO
	validateCoords \2, \3
	IF _NARG >= 4
		ld \1, \4 + SCREEN_WIDTH * \3 + \2
	ELSE
		ld \1, wTileMap + SCREEN_WIDTH * \3 + \2
	ENDC
ENDM

;\1 = X
;\2 = Y
;\3 = which tilemap (optional)
aCoord: MACRO
	validateCoords \1, \2
	IF _NARG >= 3
		ld a, [\3 + SCREEN_WIDTH * \2 + \1]
	ELSE
		ld a, [wTileMap + SCREEN_WIDTH * \2 + \1]
	ENDC
ENDM

;\1 = X
;\2 = Y
;\3 = which tilemap (optional)
Coorda: MACRO
	validateCoords \1, \2
	IF _NARG >= 3
		ld [\3 + SCREEN_WIDTH * \2 + \1], a
	ELSE
		ld [wTileMap + SCREEN_WIDTH * \2 + \1], a
	ENDC
ENDM

;\1 = X
;\2 = Y
;\3 = which tilemap (optional)
dwCoord: MACRO
	validateCoords \1, \2
	IF _NARG >= 3
		dw \3 + SCREEN_WIDTH * \2 + \1
	ELSE
		dw wTileMap + SCREEN_WIDTH * \2 + \1
	ENDC
ENDM

;\1 = r
;\2 = X
;\3 = Y
;\4 = map width
overworldMapCoord: MACRO
	ld \1, wOverworldMap + ((\2) + 3) + (((\3) + 3) * ((\4) + (3 * 2)))
ENDM

; macro for two nibbles
dn: MACRO
	db (\1 << 4 | \2)
ENDM

; macro for putting a byte then a word
dbw: MACRO
	db \1
	dw \2
ENDM

dba: MACRO
	dbw BANK(\1), \1
ENDM

dwb: MACRO
	dw \1
	db \2
ENDM

dab: MACRO
	dwb \1, BANK(\1)
ENDM

dbbw: MACRO
	db \1, \2
	dw \3
ENDM

bigdw: MACRO ; big-endian word
	dw ((\1)/$100) + (((\1)&$ff)*$100)
ENDM

dt: MACRO ; three-byte (big-endian)
	db (\1 >> 16) & $ff
	db (\1 >> 8) & $ff
	db \1 & $ff
ENDM

; Predef macro.
predef_const: MACRO
	const \1PredefID
ENDM

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

tx_pre_const: MACRO
	const \1_id
ENDM

add_tx_pre: MACRO
\1_id:: dw \1
ENDM

db_tx_pre: MACRO
	db (\1_id - TextPredefs) / 2 + 1
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

inc_section: MACRO
	SECTION \1, ROMX
	include \1
ENDM
