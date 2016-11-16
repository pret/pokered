LavenderMartObject:
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $3, $ff
	db $7, $4, $3, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_MART_GUY, $0, $5, STAY, RIGHT, $1 ; person
	object SPRITE_BALDING_GUY, $3, $4, STAY, NONE, $2 ; person
	object SPRITE_BLACK_HAIR_BOY_1, $7, $2, STAY, NONE, $3 ; person

	; warp-to
	EVENT_DISP LAVENDER_MART_WIDTH, $7, $3
	EVENT_DISP LAVENDER_MART_WIDTH, $7, $4
