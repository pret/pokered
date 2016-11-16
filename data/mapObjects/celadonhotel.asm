CeladonHotelObject:
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $c, $ff
	db $7, $4, $c, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_OLD_MEDIUM_WOMAN, $3, $1, STAY, DOWN, $1 ; person
	object SPRITE_FOULARD_WOMAN, $2, $4, STAY, NONE, $2 ; person
	object SPRITE_BLACK_HAIR_BOY_2, $8, $4, WALK, $2, $3 ; person

	; warp-to
	EVENT_DISP CELADON_HOTEL_WIDTH, $7, $3
	EVENT_DISP CELADON_HOTEL_WIDTH, $7, $4
