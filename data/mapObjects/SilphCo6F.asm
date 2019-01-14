SilphCo6F_Object:
	db $2e ; border block

	db 5 ; warps
	warp 16, 0, 1, SILPH_CO_7F
	warp 14, 0, 0, SILPH_CO_5F
	warp 18, 0, 0, SILPH_CO_ELEVATOR
	warp 3, 3, 4, SILPH_CO_4F
	warp 23, 3, 6, SILPH_CO_2F

	db 0 ; signs

	db 10 ; objects
	object SPRITE_LAPRAS_GIVER, 10, 6, STAY, NONE, 1 ; person
	object SPRITE_LAPRAS_GIVER, 20, 6, STAY, NONE, 2 ; person
	object SPRITE_ERIKA, 21, 6, STAY, DOWN, 3 ; person
	object SPRITE_ERIKA, 11, 10, STAY, RIGHT, 4 ; person
	object SPRITE_LAPRAS_GIVER, 18, 13, STAY, UP, 5 ; person
	object SPRITE_ROCKET, 17, 3, STAY, RIGHT, 6, OPP_ROCKET, 30
	object SPRITE_OAK_AIDE, 7, 8, STAY, DOWN, 7, OPP_SCIENTIST, 7
	object SPRITE_ROCKET, 14, 15, STAY, LEFT, 8, OPP_ROCKET, 31
	object SPRITE_BALL, 3, 12, STAY, NONE, 9, HP_UP
	object SPRITE_BALL, 2, 15, STAY, NONE, 10, X_ACCURACY

	; warp-to
	warp_to 16, 0, SILPH_CO_6F_WIDTH ; SILPH_CO_7F
	warp_to 14, 0, SILPH_CO_6F_WIDTH ; SILPH_CO_5F
	warp_to 18, 0, SILPH_CO_6F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to 3, 3, SILPH_CO_6F_WIDTH ; SILPH_CO_4F
	warp_to 23, 3, SILPH_CO_6F_WIDTH ; SILPH_CO_2F
