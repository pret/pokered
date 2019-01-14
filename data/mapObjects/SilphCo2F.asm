SilphCo2F_Object:
	db $2e ; border block

	db 7 ; warps
	warp 24, 0, 2, SILPH_CO_1F
	warp 26, 0, 0, SILPH_CO_3F
	warp 20, 0, 0, SILPH_CO_ELEVATOR
	warp 3, 3, 6, SILPH_CO_3F
	warp 13, 3, 4, SILPH_CO_8F
	warp 27, 15, 5, SILPH_CO_8F
	warp 9, 15, 4, SILPH_CO_6F

	db 0 ; signs

	db 5 ; objects
	object SPRITE_ERIKA, 10, 1, STAY, UP, 1 ; person
	object SPRITE_OAK_AIDE, 5, 12, STAY, DOWN, 2, OPP_SCIENTIST, 2
	object SPRITE_OAK_AIDE, 24, 13, STAY, LEFT, 3, OPP_SCIENTIST, 3
	object SPRITE_ROCKET, 16, 11, STAY, UP, 4, OPP_ROCKET, 23
	object SPRITE_ROCKET, 24, 7, STAY, UP, 5, OPP_ROCKET, 24

	; warp-to
	warp_to 24, 0, SILPH_CO_2F_WIDTH ; SILPH_CO_1F
	warp_to 26, 0, SILPH_CO_2F_WIDTH ; SILPH_CO_3F
	warp_to 20, 0, SILPH_CO_2F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to 3, 3, SILPH_CO_2F_WIDTH ; SILPH_CO_3F
	warp_to 13, 3, SILPH_CO_2F_WIDTH ; SILPH_CO_8F
	warp_to 27, 15, SILPH_CO_2F_WIDTH ; SILPH_CO_8F
	warp_to 9, 15, SILPH_CO_2F_WIDTH ; SILPH_CO_6F
