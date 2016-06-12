ViridianMartObject:
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $1, $ff
	db $7, $4, $1, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_MART_GUY, $0, $5, STAY, RIGHT, $1 ; person
	object SPRITE_BUG_CATCHER, $5, $5, WALK, $1, $2 ; person
	object SPRITE_BLACK_HAIR_BOY_1, $3, $3, STAY, NONE, $3 ; person

	; warp-to
	EVENT_DISP VIRIDIAN_MART_WIDTH, $7, $3
	EVENT_DISP VIRIDIAN_MART_WIDTH, $7, $4
