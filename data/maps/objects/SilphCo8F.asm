SilphCo8F_Object:
	db $2e ; border block

	db 7 ; warps
	warp 16, 0, 1, SILPH_CO_9F
	warp 14, 0, 0, SILPH_CO_7F
	warp 18, 0, 0, SILPH_CO_ELEVATOR
	warp 3, 11, 6, SILPH_CO_8F
	warp 3, 15, 4, SILPH_CO_2F
	warp 11, 5, 5, SILPH_CO_2F
	warp 11, 9, 3, SILPH_CO_8F

	db 0 ; signs

	db 4 ; objects
	object SPRITE_LAPRAS_GIVER, 4, 2, STAY, NONE, 1 ; person
	object SPRITE_ROCKET, 19, 2, STAY, LEFT, 2, OPP_ROCKET, 35
	object SPRITE_OAK_AIDE, 10, 2, STAY, DOWN, 3, OPP_SCIENTIST, 9
	object SPRITE_ROCKET, 12, 15, STAY, RIGHT, 4, OPP_ROCKET, 36

	; warp-to
	warp_to 16, 0, SILPH_CO_8F_WIDTH ; SILPH_CO_9F
	warp_to 14, 0, SILPH_CO_8F_WIDTH ; SILPH_CO_7F
	warp_to 18, 0, SILPH_CO_8F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to 3, 11, SILPH_CO_8F_WIDTH ; SILPH_CO_8F
	warp_to 3, 15, SILPH_CO_8F_WIDTH ; SILPH_CO_2F
	warp_to 11, 5, SILPH_CO_8F_WIDTH ; SILPH_CO_2F
	warp_to 11, 9, SILPH_CO_8F_WIDTH ; SILPH_CO_8F_WIDTH
