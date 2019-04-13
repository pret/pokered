FuchsiaMart_Object:
	db $0 ; border block

	db 2 ; warps
	warp 3, 7, 0, -1
	warp 4, 7, 0, -1

	db 0 ; signs

	db 3 ; objects
	object SPRITE_MART_GUY, 0, 5, STAY, RIGHT, 1 ; person
	object SPRITE_FAT_BALD_GUY, 4, 2, STAY, NONE, 2 ; person
	object SPRITE_LASS, 6, 5, WALK, 1, 3 ; person

	; warp-to
	warp_to 3, 7, FUCHSIA_MART_WIDTH
	warp_to 4, 7, FUCHSIA_MART_WIDTH
