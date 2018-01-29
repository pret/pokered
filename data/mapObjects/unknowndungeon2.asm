UnknownDungeon2Object:
	db $7d ; border block

	db $6 ; warps
	warp $1d, $1, $2, UNKNOWN_DUNGEON_1
	warp $16, $6, $3, UNKNOWN_DUNGEON_1
	warp $13, $7, $4, UNKNOWN_DUNGEON_1
	warp $9, $1, $5, UNKNOWN_DUNGEON_1
	warp $1, $3, $6, UNKNOWN_DUNGEON_1
	warp $3, $b, $7, UNKNOWN_DUNGEON_1

	db $0 ; signs

	db $3 ; objects
	object SPRITE_BALL, $1d, $9, STAY, NONE, $1, PP_UP
	object SPRITE_BALL, $4, $f, STAY, NONE, $2, ULTRA_BALL
	object SPRITE_BALL, $d, $6, STAY, NONE, $3, FULL_RESTORE

	; warp-to
	warp_to $1d, $1, UNKNOWN_DUNGEON_2_WIDTH ; UNKNOWN_DUNGEON_1
	warp_to $16, $6, UNKNOWN_DUNGEON_2_WIDTH ; UNKNOWN_DUNGEON_1
	warp_to $13, $7, UNKNOWN_DUNGEON_2_WIDTH ; UNKNOWN_DUNGEON_1
	warp_to $9, $1, UNKNOWN_DUNGEON_2_WIDTH ; UNKNOWN_DUNGEON_1
	warp_to $1, $3, UNKNOWN_DUNGEON_2_WIDTH ; UNKNOWN_DUNGEON_1
	warp_to $3, $b, UNKNOWN_DUNGEON_2_WIDTH ; UNKNOWN_DUNGEON_1
