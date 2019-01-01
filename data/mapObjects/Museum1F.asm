Museum1F_Object:
	db $a ; border block

	db 5 ; warps
	warp 10, 7, 0, -1
	warp 11, 7, 0, -1
	warp 16, 7, 1, -1
	warp 17, 7, 1, -1
	warp 7, 7, 0, MUSEUM_2F

	db 0 ; signs

	db 5 ; objects
	object SPRITE_OAK_AIDE, 12, 4, STAY, LEFT, 1 ; person
	object SPRITE_GAMBLER, 1, 4, STAY, NONE, 2 ; person
	object SPRITE_OAK_AIDE, 15, 2, STAY, DOWN, 3 ; person
	object SPRITE_OAK_AIDE, 17, 4, STAY, NONE, 4 ; person
	object SPRITE_OLD_AMBER, 16, 2, STAY, NONE, 5 ; person

	; warp-to
	warp_to 10, 7, MUSEUM_1F_WIDTH
	warp_to 11, 7, MUSEUM_1F_WIDTH
	warp_to 16, 7, MUSEUM_1F_WIDTH
	warp_to 17, 7, MUSEUM_1F_WIDTH
	warp_to 7, 7, MUSEUM_1F_WIDTH ; MUSEUM_2F
