FuchsiaMart_Object:
	db $0 ; border block

	db 2 ; warps
	warp 3, 7, 0, LAST_MAP
	warp 4, 7, 0, LAST_MAP

	db 0 ; signs

	db 3 ; objects
	object SPRITE_CLERK, 0, 5, STAY, RIGHT, 1 ; person
	object SPRITE_MIDDLE_AGED_MAN, 4, 2, STAY, NONE, 2 ; person
	object SPRITE_COOLTRAINER_F, 6, 5, WALK, UP_DOWN, 3 ; person

	; warp-to
	warp_to 3, 7, FUCHSIA_MART_WIDTH
	warp_to 4, 7, FUCHSIA_MART_WIDTH
