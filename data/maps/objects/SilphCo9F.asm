SilphCo9F_Object:
	db $2e ; border block

	db 5 ; warps
	warp 14, 0, 0, SILPH_CO_10F
	warp 16, 0, 0, SILPH_CO_8F
	warp 18, 0, 0, SILPH_CO_ELEVATOR
	warp 9, 3, 7, SILPH_CO_3F
	warp 17, 15, 4, SILPH_CO_5F

	db 0 ; signs

	db 4 ; objects
	object SPRITE_NURSE, 3, 14, STAY, DOWN, 1 ; person
	object SPRITE_ROCKET, 2, 4, STAY, UP, 2, OPP_ROCKET, 37
	object SPRITE_OAK_AIDE, 21, 13, STAY, DOWN, 3, OPP_SCIENTIST, 10
	object SPRITE_ROCKET, 13, 16, STAY, UP, 4, OPP_ROCKET, 38

	; warp-to
	warp_to 14, 0, SILPH_CO_9F_WIDTH ; SILPH_CO_10F
	warp_to 16, 0, SILPH_CO_9F_WIDTH ; SILPH_CO_8F
	warp_to 18, 0, SILPH_CO_9F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to 9, 3, SILPH_CO_9F_WIDTH ; SILPH_CO_3F
	warp_to 17, 15, SILPH_CO_9F_WIDTH ; SILPH_CO_5F
