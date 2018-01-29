UnknownDungeon1Object:
	db $7d ; border block

	db $9 ; warps
	warp $18, $11, $6, $ff
	warp $19, $11, $6, $ff
	warp $1b, $1, $0, UNKNOWN_DUNGEON_2
	warp $17, $7, $1, UNKNOWN_DUNGEON_2
	warp $12, $9, $2, UNKNOWN_DUNGEON_2
	warp $7, $1, $3, UNKNOWN_DUNGEON_2
	warp $1, $3, $4, UNKNOWN_DUNGEON_2
	warp $3, $b, $5, UNKNOWN_DUNGEON_2
	warp $0, $6, $0, UNKNOWN_DUNGEON_3

	db $0 ; signs

	db $3 ; objects
	object SPRITE_BALL, $7, $d, STAY, NONE, $1, FULL_RESTORE
	object SPRITE_BALL, $13, $3, STAY, NONE, $2, MAX_ELIXER
	object SPRITE_BALL, $5, $0, STAY, NONE, $3, NUGGET

	; warp-to
	warp_to $18, $11, UNKNOWN_DUNGEON_1_WIDTH
	warp_to $19, $11, UNKNOWN_DUNGEON_1_WIDTH
	warp_to $1b, $1, UNKNOWN_DUNGEON_1_WIDTH ; UNKNOWN_DUNGEON_2
	warp_to $17, $7, UNKNOWN_DUNGEON_1_WIDTH ; UNKNOWN_DUNGEON_2
	warp_to $12, $9, UNKNOWN_DUNGEON_1_WIDTH ; UNKNOWN_DUNGEON_2
	warp_to $7, $1, UNKNOWN_DUNGEON_1_WIDTH ; UNKNOWN_DUNGEON_2
	warp_to $1, $3, UNKNOWN_DUNGEON_1_WIDTH ; UNKNOWN_DUNGEON_2
	warp_to $3, $b, UNKNOWN_DUNGEON_1_WIDTH ; UNKNOWN_DUNGEON_2
	warp_to $0, $6, UNKNOWN_DUNGEON_1_WIDTH ; UNKNOWN_DUNGEON_3
