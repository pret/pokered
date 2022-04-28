MACRO validate_coords
	IF _NARG >= 4
		IF \1 >= \3
			fail "x coord out of range"
		ENDC
		IF \2 >= \4
			fail "y coord out of range"
		ENDC
	ELSE
		validate_coords \1, \2, SCREEN_WIDTH, SCREEN_HEIGHT
	ENDC
ENDM

DEF hlcoord EQUS "coord hl,"
DEF bccoord EQUS "coord bc,"
DEF decoord EQUS "coord de,"

MACRO coord
; register, x, y[, origin]
	validate_coords \2, \3
	IF _NARG >= 4
		ld \1, (\3) * SCREEN_WIDTH + (\2) + \4
	ELSE
		ld \1, (\3) * SCREEN_WIDTH + (\2) + wTileMap
	ENDC
ENDM

DEF hlbgcoord EQUS "bgcoord hl,"
DEF bcbgcoord EQUS "bgcoord bc,"
DEF debgcoord EQUS "bgcoord de,"

MACRO bgcoord
; register, x, y[, origin]
	validate_coords \2, \3, BG_MAP_WIDTH, BG_MAP_HEIGHT
	IF _NARG >= 4
		ld \1, (\3) * BG_MAP_WIDTH + (\2) + \4
	ELSE
		ld \1, (\3) * BG_MAP_WIDTH + (\2) + vBGMap0
	ENDC
ENDM

DEF hlowcoord EQUS "owcoord hl,"
DEF bcowcoord EQUS "owcoord bc,"
DEF deowcoord EQUS "owcoord de,"

MACRO owcoord
; register, x, y, map width
	ld \1, wOverworldMap + ((\2) + 3) + (((\3) + 3) * ((\4) + (3 * 2)))
ENDM

MACRO event_displacement
; map width, x blocks, y blocks
	dw (wOverworldMap + 7 + (\1) + ((\1) + 6) * ((\3) >> 1) + ((\2) >> 1))
	db \3, \2
ENDM

MACRO dwcoord
; x, y
	validate_coords \1, \2
	IF _NARG >= 3
		dw (\2) * SCREEN_WIDTH + (\1) + \3
	ELSE
		dw (\2) * SCREEN_WIDTH + (\1) + wTileMap
	ENDC
ENDM

MACRO ldcoord_a
; x, y[, origin]
	validate_coords \1, \2
	IF _NARG >= 3
		ld [(\2) * SCREEN_WIDTH + (\1) + \3], a
	ELSE
		ld [(\2) * SCREEN_WIDTH + (\1) + wTileMap], a
	ENDC
ENDM

MACRO lda_coord
; x, y[, origin]
	validate_coords \1, \2
	IF _NARG >= 3
		ld a, [(\2) * SCREEN_WIDTH + (\1) + \3]
	ELSE
		ld a, [(\2) * SCREEN_WIDTH + (\1) + wTileMap]
	ENDC
ENDM

MACRO dbmapcoord
; x, y
	db \2, \1
ENDM
