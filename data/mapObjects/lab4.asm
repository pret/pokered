Lab4Object:
	db 23 ; border block

	db 2 ; warps
	warp 2, 7, 4, CINNABAR_LAB_1
	warp 3, 7, 4, CINNABAR_LAB_1

	db 0 ; signs

	db 2 ; objects
	object SPRITE_OAK_AIDE, 5, 2, WALK, 2, 1 ; person
	object SPRITE_OAK_AIDE, 7, 6, STAY, UP, 2 ; person

	; warp-to
	warp_to 2, 7, CINNABAR_LAB_4_WIDTH ; CINNABAR_LAB_1
	warp_to 3, 7, CINNABAR_LAB_4_WIDTH ; CINNABAR_LAB_1
