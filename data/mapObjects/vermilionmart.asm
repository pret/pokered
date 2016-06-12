VermilionMartObject:
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $2, $ff
	db $7, $4, $2, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_MART_GUY, $0, $5, STAY, RIGHT, $1 ; person
	object SPRITE_BLACK_HAIR_BOY_1, $5, $6, STAY, NONE, $2 ; person
	object SPRITE_LASS, $3, $3, WALK, $2, $3 ; person

	; warp-to
	EVENT_DISP VERMILION_MART_WIDTH, $7, $3
	EVENT_DISP VERMILION_MART_WIDTH, $7, $4
