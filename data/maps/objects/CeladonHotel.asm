CeladonHotel_Object:
	db $0 ; border block

	db 2 ; warps
	warp 3, 7, 12, LAST_MAP
	warp 4, 7, 12, LAST_MAP

	db 0 ; signs

	db 3 ; objects
	object SPRITE_GRANNY, 3, 1, STAY, DOWN, 1 ; person
	object SPRITE_BEAUTY, 2, 4, STAY, NONE, 2 ; person
	object SPRITE_SUPER_NERD, 8, 4, WALK, 2, 3 ; person

	; warp-to
	warp_to 3, 7, CELADON_HOTEL_WIDTH
	warp_to 4, 7, CELADON_HOTEL_WIDTH
