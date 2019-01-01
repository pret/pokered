SilphCo1F_Object:
	db $2e ; border block

	db 5 ; warps
	warp 10, 17, 5, -1
	warp 11, 17, 5, -1
	warp 26, 0, 0, SILPH_CO_2F
	warp 20, 0, 0, SILPH_CO_ELEVATOR
	warp 16, 10, 6, SILPH_CO_3F

	db 0 ; signs

	db 1 ; objects
	object SPRITE_CABLE_CLUB_WOMAN, 4, 2, STAY, DOWN, 1 ; person

	; warp-to
	warp_to 10, 17, SILPH_CO_1F_WIDTH
	warp_to 11, 17, SILPH_CO_1F_WIDTH
	warp_to 26, 0, SILPH_CO_1F_WIDTH ; SILPH_CO_2F
	warp_to 20, 0, SILPH_CO_1F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to 16, 10, SILPH_CO_1F_WIDTH ; SILPH_CO_3F
