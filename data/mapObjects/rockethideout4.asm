RocketHideout4Object:
	db $2e ; border block

	db $3 ; warps
	warp $13, $a, $1, ROCKET_HIDEOUT_3
	warp $18, $f, $0, ROCKET_HIDEOUT_ELEVATOR
	warp $19, $f, $1, ROCKET_HIDEOUT_ELEVATOR

	db $0 ; signs

	db $9 ; objects
	object SPRITE_GIOVANNI, $19, $3, STAY, DOWN, $1, OPP_GIOVANNI, $1
	object SPRITE_ROCKET, $17, $c, STAY, DOWN, $2, OPP_ROCKET, $10
	object SPRITE_ROCKET, $1a, $c, STAY, DOWN, $3, OPP_ROCKET, $11
	object SPRITE_ROCKET, $b, $2, STAY, DOWN, $4, OPP_ROCKET, $12
	object SPRITE_BALL, $a, $c, STAY, NONE, $5, HP_UP
	object SPRITE_BALL, $9, $4, STAY, NONE, $6, TM_02
	object SPRITE_BALL, $c, $14, STAY, NONE, $7, IRON
	object SPRITE_BALL, $19, $2, STAY, NONE, $8, SILPH_SCOPE
	object SPRITE_BALL, $a, $2, STAY, NONE, $9, LIFT_KEY

	; warp-to
	warp_to $13, $a, ROCKET_HIDEOUT_4_WIDTH ; ROCKET_HIDEOUT_3
	warp_to $18, $f, ROCKET_HIDEOUT_4_WIDTH ; ROCKET_HIDEOUT_ELEVATOR
	warp_to $19, $f, ROCKET_HIDEOUT_4_WIDTH ; ROCKET_HIDEOUT_ELEVATOR
