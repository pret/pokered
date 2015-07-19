LavenderMartObject: ; 0x5c95d (size=38)
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $3, $ff
	db $7, $4, $3, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_MART_GUY, $0, $5, FACE, LEFT, $1 ; person
	object SPRITE_BALDING_GUY, $3, $4, FACE, STAY, $2 ; person
	object SPRITE_BLACK_HAIR_BOY_1, $7, $2, FACE, STAY, $3 ; person

	; warp-to
	EVENT_DISP LAVENDER_MART_WIDTH, $7, $3
	EVENT_DISP LAVENDER_MART_WIDTH, $7, $4
