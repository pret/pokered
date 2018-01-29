RocketHideout3Object:
	db 46 ; border block

	db 2 ; warps
	warp 25, 6, 1, ROCKET_HIDEOUT_2
	warp 19, 18, 0, ROCKET_HIDEOUT_4

	db 0 ; signs

	db 4 ; objects
	object SPRITE_ROCKET, 10, 22, STAY, RIGHT, 1, OPP_ROCKET, 14
	object SPRITE_ROCKET, 26, 12, STAY, UP, 2, OPP_ROCKET, 15
	object SPRITE_BALL, 26, 17, STAY, NONE, 3, TM_10
	object SPRITE_BALL, 20, 14, STAY, NONE, 4, RARE_CANDY

	; warp-to
	warp_to 25, 6, ROCKET_HIDEOUT_3_WIDTH ; ROCKET_HIDEOUT_2
	warp_to 19, 18, ROCKET_HIDEOUT_3_WIDTH ; ROCKET_HIDEOUT_4
