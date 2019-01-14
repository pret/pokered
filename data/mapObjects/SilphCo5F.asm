SilphCo5F_Object:
	db $2e ; border block

	db 7 ; warps
	warp 24, 0, 1, SILPH_CO_6F
	warp 26, 0, 1, SILPH_CO_4F
	warp 20, 0, 0, SILPH_CO_ELEVATOR
	warp 27, 3, 5, SILPH_CO_7F
	warp 9, 15, 4, SILPH_CO_9F
	warp 11, 5, 4, SILPH_CO_3F
	warp 3, 15, 5, SILPH_CO_3F

	db 0 ; signs

	db 11 ; objects
	object SPRITE_LAPRAS_GIVER, 13, 9, STAY, NONE, 1 ; person
	object SPRITE_ROCKET, 8, 16, STAY, RIGHT, 2, OPP_ROCKET, 28
	object SPRITE_OAK_AIDE, 8, 3, STAY, RIGHT, 3, OPP_SCIENTIST, 6
	object SPRITE_ROCKER, 18, 10, STAY, UP, 4, OPP_JUGGLER, 1
	object SPRITE_ROCKET, 28, 4, STAY, UP, 5, OPP_ROCKET, 29
	object SPRITE_BALL, 2, 13, STAY, NONE, 6, TM_09
	object SPRITE_BALL, 4, 6, STAY, NONE, 7, PROTEIN
	object SPRITE_BALL, 21, 16, STAY, NONE, 8, CARD_KEY
	object SPRITE_CLIPBOARD, 22, 12, STAY, NONE, 9 ; person
	object SPRITE_CLIPBOARD, 25, 10, STAY, NONE, 10 ; person
	object SPRITE_CLIPBOARD, 24, 6, STAY, NONE, 11 ; person

	; warp-to
	warp_to 24, 0, SILPH_CO_5F_WIDTH ; SILPH_CO_6F
	warp_to 26, 0, SILPH_CO_5F_WIDTH ; SILPH_CO_4F
	warp_to 20, 0, SILPH_CO_5F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to 27, 3, SILPH_CO_5F_WIDTH ; SILPH_CO_7F
	warp_to 9, 15, SILPH_CO_5F_WIDTH ; SILPH_CO_9F
	warp_to 11, 5, SILPH_CO_5F_WIDTH ; SILPH_CO_3F
	warp_to 3, 15, SILPH_CO_5F_WIDTH ; SILPH_CO_3F
