FuchsiaGym_Object:
	db $3 ; border block

	db 2 ; warps
	warp 4, 17, 5, -1
	warp 5, 17, 5, -1

	db 0 ; signs

	db 8 ; objects
	object SPRITE_BLACKBELT, 4, 10, STAY, DOWN, 1, OPP_KOGA, 1
	object SPRITE_ROCKER, 8, 13, STAY, DOWN, 2, OPP_JUGGLER, 7
	object SPRITE_ROCKER, 7, 8, STAY, RIGHT, 3, OPP_JUGGLER, 3
	object SPRITE_ROCKER, 1, 12, STAY, DOWN, 4, OPP_JUGGLER, 8
	object SPRITE_ROCKER, 3, 5, STAY, UP, 5, OPP_TAMER, 1
	object SPRITE_ROCKER, 8, 2, STAY, DOWN, 6, OPP_TAMER, 2
	object SPRITE_ROCKER, 2, 7, STAY, LEFT, 7, OPP_JUGGLER, 4
	object SPRITE_GYM_HELPER, 7, 15, STAY, DOWN, 8 ; person

	; warp-to
	warp_to 4, 17, FUCHSIA_GYM_WIDTH
	warp_to 5, 17, FUCHSIA_GYM_WIDTH
