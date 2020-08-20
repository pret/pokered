CeladonDiner_Object:
	db $f ; border block

	db 2 ; warps
	warp 3, 7, 10, LAST_MAP
	warp 4, 7, 10, LAST_MAP

	db 0 ; signs

	db 5 ; objects
	object SPRITE_COOK, 8, 5, WALK, LEFT_RIGHT, 1 ; person
	object SPRITE_MIDDLE_AGED_WOMAN, 7, 2, STAY, NONE, 2 ; person
	object SPRITE_MIDDLE_AGED_MAN, 1, 4, STAY, DOWN, 3 ; person
	object SPRITE_FISHER, 5, 3, STAY, RIGHT, 4 ; person
	object SPRITE_GYM_GUIDE, 0, 1, STAY, DOWN, 5 ; person

	; warp-to
	warp_to 3, 7, CELADON_DINER_WIDTH
	warp_to 4, 7, CELADON_DINER_WIDTH
