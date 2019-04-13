SilphCo3F_Object:
	db $2e ; border block

	db 10 ; warps
	warp 26, 0, 1, SILPH_CO_2F
	warp 24, 0, 0, SILPH_CO_4F
	warp 20, 0, 0, SILPH_CO_ELEVATOR
	warp 23, 11, 9, SILPH_CO_3F
	warp 3, 3, 5, SILPH_CO_5F
	warp 3, 15, 6, SILPH_CO_5F
	warp 27, 3, 3, SILPH_CO_2F
	warp 3, 11, 3, SILPH_CO_9F
	warp 11, 11, 4, SILPH_CO_7F
	warp 27, 15, 3, SILPH_CO_3F

	db 0 ; signs

	db 4 ; objects
	object SPRITE_LAPRAS_GIVER, 24, 8, STAY, NONE, 1 ; person
	object SPRITE_ROCKET, 20, 7, STAY, LEFT, 2, OPP_ROCKET, 25
	object SPRITE_OAK_AIDE, 7, 9, STAY, DOWN, 3, OPP_SCIENTIST, 4
	object SPRITE_BALL, 8, 5, STAY, NONE, 4, HYPER_POTION

	; warp-to
	warp_to 26, 0, SILPH_CO_3F_WIDTH ; SILPH_CO_2F
	warp_to 24, 0, SILPH_CO_3F_WIDTH ; SILPH_CO_4F
	warp_to 20, 0, SILPH_CO_3F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to 23, 11, SILPH_CO_3F_WIDTH ; SILPH_CO_3F
	warp_to 3, 3, SILPH_CO_3F_WIDTH ; SILPH_CO_5F
	warp_to 3, 15, SILPH_CO_3F_WIDTH ; SILPH_CO_5F
	warp_to 27, 3, SILPH_CO_3F_WIDTH ; SILPH_CO_2F
	warp_to 3, 11, SILPH_CO_3F_WIDTH ; SILPH_CO_9F
	warp_to 11, 11, SILPH_CO_3F_WIDTH ; SILPH_CO_7F
	warp_to 27, 15, SILPH_CO_3F_WIDTH ; SILPH_CO_3F
