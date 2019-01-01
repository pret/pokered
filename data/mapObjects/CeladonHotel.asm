CeladonHotel_Object:
	db $0 ; border block

	db 2 ; warps
	warp 3, 7, 12, -1
	warp 4, 7, 12, -1

	db 0 ; signs

	db 3 ; objects
	object SPRITE_OLD_MEDIUM_WOMAN, 3, 1, STAY, DOWN, 1 ; person
	object SPRITE_FOULARD_WOMAN, 2, 4, STAY, NONE, 2 ; person
	object SPRITE_BLACK_HAIR_BOY_2, 8, 4, WALK, 2, 3 ; person

	; warp-to
	warp_to 3, 7, CELADON_HOTEL_WIDTH
	warp_to 4, 7, CELADON_HOTEL_WIDTH
