SSAnneBow_Object:
	db $23 ; border block

	db 2 ; warps
	warp 13, 6, 0, SS_ANNE_3F
	warp 13, 7, 0, SS_ANNE_3F

	db 0 ; signs

	db 5 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, 5, 2, STAY, UP, 1 ; person
	object SPRITE_SAILOR, 4, 9, STAY, NONE, 2 ; person
	object SPRITE_BLACK_HAIR_BOY_1, 7, 11, STAY, NONE, 3 ; person
	object SPRITE_SAILOR, 4, 4, STAY, DOWN, 4, OPP_SAILOR, 1
	object SPRITE_SAILOR, 10, 8, STAY, UP, 5, OPP_SAILOR, 2

	; warp-to
	warp_to 13, 6, SS_ANNE_BOW_WIDTH ; SS_ANNE_3F
	warp_to 13, 7, SS_ANNE_BOW_WIDTH ; SS_ANNE_3F
