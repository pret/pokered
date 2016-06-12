SaffronMartObject:
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $4, $ff
	db $7, $4, $4, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_MART_GUY, $0, $5, STAY, RIGHT, $1 ; person
	object SPRITE_BLACK_HAIR_BOY_2, $4, $2, STAY, NONE, $2 ; person
	object SPRITE_LASS, $6, $5, WALK, $0, $3 ; person

	; warp-to
	EVENT_DISP SAFFRON_MART_WIDTH, $7, $3
	EVENT_DISP SAFFRON_MART_WIDTH, $7, $4
