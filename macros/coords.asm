MACRO? validate_coords
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

MACRO? hlcoord
	coord hl, \#
ENDM

MACRO? bccoord
	coord bc, \#
ENDM

MACRO? decoord
	coord de, \#
ENDM

MACRO? coord
; register, x, y[, origin]
	validate_coords \2, \3
	IF _NARG >= 4
		ld \1, (\3) * SCREEN_WIDTH + (\2) + \4
	ELSE
		ld \1, (\3) * SCREEN_WIDTH + (\2) + wTileMap
	ENDC
ENDM

MACRO? hlbgcoord
	bgcoord hl, \#
ENDM

MACRO? bcbgcoord
	bgcoord bc, \#
ENDM

MACRO? debgcoord
	bgcoord de, \#
ENDM

MACRO? bgcoord
; register, x, y[, origin]
	validate_coords \2, \3, TILEMAP_WIDTH, TILEMAP_HEIGHT
	IF _NARG >= 4
		ld \1, (\3) * TILEMAP_WIDTH + (\2) + \4
	ELSE
		ld \1, (\3) * TILEMAP_WIDTH + (\2) + vBGMap0
	ENDC
ENDM

MACRO? hlowcoord
	owcoord hl, \#
ENDM

MACRO? bcowcoord
	owcoord bc, \#
ENDM

MACRO? deowcoord
	owcoord de, \#
ENDM

MACRO? owcoord
; register, x, y, map width
	ld \1, wOverworldMap + ((\2) + 3) + (((\3) + 3) * ((\4) + (3 * 2)))
ENDM

MACRO? event_displacement
; map width, x blocks, y blocks
	dw (wOverworldMap + 7 + (\1) + ((\1) + 6) * ((\3) >> 1) + ((\2) >> 1))
	db \3, \2
ENDM

MACRO? dwcoord
; x, y
	validate_coords \1, \2
	IF _NARG >= 3
		dw (\2) * SCREEN_WIDTH + (\1) + \3
	ELSE
		dw (\2) * SCREEN_WIDTH + (\1) + wTileMap
	ENDC
ENDM

MACRO? ldcoord_a
; x, y[, origin]
	validate_coords \1, \2
	IF _NARG >= 3
		ld [(\2) * SCREEN_WIDTH + (\1) + \3], a
	ELSE
		ld [(\2) * SCREEN_WIDTH + (\1) + wTileMap], a
	ENDC
ENDM

MACRO? lda_coord
; x, y[, origin]
	validate_coords \1, \2
	IF _NARG >= 3
		ld a, [(\2) * SCREEN_WIDTH + (\1) + \3]
	ELSE
		ld a, [(\2) * SCREEN_WIDTH + (\1) + wTileMap]
	ENDC
ENDM

MACRO? dbmapcoord
; x, y
	db \2, \1
ENDM
