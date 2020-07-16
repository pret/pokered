validate_coords: MACRO
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

hlcoord EQUS "coord hl,"
bccoord EQUS "coord bc,"
decoord EQUS "coord de,"

coord: MACRO
; register, x, y[, origin]
	validate_coords \2, \3
	IF _NARG >= 4
		ld \1, (\3) * SCREEN_WIDTH + (\2) + \4
	ELSE
		ld \1, (\3) * SCREEN_WIDTH + (\2) + wTileMap
	ENDC
ENDM

hlbgcoord EQUS "bgcoord hl,"
bcbgcoord EQUS "bgcoord bc,"
debgcoord EQUS "bgcoord de,"

bgcoord: MACRO
; register, x, y[, origin]
	validate_coords \2, \3, BG_MAP_WIDTH, BG_MAP_HEIGHT
	IF _NARG >= 4
		ld \1, (\3) * BG_MAP_WIDTH + (\2) + \4
	ELSE
		ld \1, (\3) * BG_MAP_WIDTH + (\2) + vBGMap0
	ENDC
ENDM

hlowcoord EQUS "owcoord hl,"
bcowcoord EQUS "owcoord bc,"
deowcoord EQUS "owcoord de,"

owcoord: MACRO
; register, x, y, map width
	ld \1, wOverworldMap + ((\2) + 3) + (((\3) + 3) * ((\4) + (3 * 2)))
ENDM

event_displacement: MACRO
; map width, x blocks, y blocks
	dw (wOverworldMap + 7 + (\1) + ((\1) + 6) * ((\3) >> 1) + ((\2) >> 1))
	db \3, \2
ENDM

dwcoord: MACRO
; x, y
	validate_coords \1, \2
	IF _NARG >= 3
		dw (\2) * SCREEN_WIDTH + (\1) + \3
	ELSE
		dw (\2) * SCREEN_WIDTH + (\1) + wTileMap
	ENDC
ENDM

ldcoord_a: MACRO
; x, y[, origin]
	validate_coords \1, \2
	IF _NARG >= 3
		ld [(\2) * SCREEN_WIDTH + (\1) + \3], a
	ELSE
		ld [(\2) * SCREEN_WIDTH + (\1) + wTileMap], a
	ENDC
ENDM

lda_coord: MACRO
; x, y[, origin]
	validate_coords \1, \2
	IF _NARG >= 3
		ld a, [(\2) * SCREEN_WIDTH + (\1) + \3]
	ELSE
		ld a, [(\2) * SCREEN_WIDTH + (\1) + wTileMap]
	ENDC
ENDM

dbmapcoord: MACRO
; x, y
	db \2, \1
ENDM
