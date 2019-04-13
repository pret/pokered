SilphCo10F_Object:
	db $2e ; border block

	db 6 ; warps
	warp 8, 0, 0, SILPH_CO_9F
	warp 10, 0, 0, SILPH_CO_11F
	warp 12, 0, 0, SILPH_CO_ELEVATOR
	warp 9, 11, 3, SILPH_CO_4F
	warp 13, 15, 5, SILPH_CO_4F
	warp 13, 7, 6, SILPH_CO_4F

	db 0 ; signs

	db 6 ; objects
	object SPRITE_ROCKET, 1, 9, STAY, RIGHT, 1, OPP_ROCKET, 39
	object SPRITE_OAK_AIDE, 10, 2, STAY, LEFT, 2, OPP_SCIENTIST, 11
	object SPRITE_ERIKA, 9, 15, WALK, 0, 3 ; person
	object SPRITE_BALL, 2, 12, STAY, NONE, 4, TM_26
	object SPRITE_BALL, 4, 14, STAY, NONE, 5, RARE_CANDY
	object SPRITE_BALL, 5, 11, STAY, NONE, 6, CARBOS

	; warp-to
	warp_to 8, 0, SILPH_CO_10F_WIDTH ; SILPH_CO_9F
	warp_to 10, 0, SILPH_CO_10F_WIDTH ; SILPH_CO_11F
	warp_to 12, 0, SILPH_CO_10F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to 9, 11, SILPH_CO_10F_WIDTH ; SILPH_CO_4F
	warp_to 13, 15, SILPH_CO_10F_WIDTH ; SILPH_CO_4F
	warp_to 13, 7, SILPH_CO_10F_WIDTH ; SILPH_CO_4F
