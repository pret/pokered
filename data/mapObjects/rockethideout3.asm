RocketHideout3Object:
	db $2e ; border block

	db $2 ; warps
	warp $19, $6, $1, ROCKET_HIDEOUT_2
	warp $13, $12, $0, ROCKET_HIDEOUT_4

	db $0 ; signs

	db $4 ; objects
	object SPRITE_ROCKET, $a, $16, STAY, RIGHT, $1, OPP_ROCKET, $e
	object SPRITE_ROCKET, $1a, $c, STAY, UP, $2, OPP_ROCKET, $f
	object SPRITE_BALL, $1a, $11, STAY, NONE, $3, TM_10
	object SPRITE_BALL, $14, $e, STAY, NONE, $4, RARE_CANDY

	; warp-to
	warp_to $19, $6, ROCKET_HIDEOUT_3_WIDTH ; ROCKET_HIDEOUT_2
	warp_to $13, $12, ROCKET_HIDEOUT_3_WIDTH ; ROCKET_HIDEOUT_4
