MtMoon3Object:
	db $3 ; border block

	db $4 ; warps
	warp $19, $9, $1, MT_MOON_2
	warp $15, $11, $4, MT_MOON_2
	warp $f, $1b, $5, MT_MOON_2
	warp $5, $7, $6, MT_MOON_2

	db $0 ; signs

	db $9 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $c, $8, STAY, RIGHT, $1, OPP_SUPER_NERD, $2
	object SPRITE_ROCKET, $b, $10, STAY, DOWN, $2, OPP_ROCKET, $1
	object SPRITE_ROCKET, $f, $16, STAY, DOWN, $3, OPP_ROCKET, $2
	object SPRITE_ROCKET, $1d, $b, STAY, UP, $4, OPP_ROCKET, $3
	object SPRITE_ROCKET, $1d, $11, STAY, LEFT, $5, OPP_ROCKET, $4
	object SPRITE_OMANYTE, $c, $6, STAY, NONE, $6 ; person
	object SPRITE_OMANYTE, $d, $6, STAY, NONE, $7 ; person
	object SPRITE_BALL, $19, $15, STAY, NONE, $8, HP_UP
	object SPRITE_BALL, $1d, $5, STAY, NONE, $9, TM_01

	; warp-to
	warp_to $19, $9, MT_MOON_3_WIDTH ; MT_MOON_2
	warp_to $15, $11, MT_MOON_3_WIDTH ; MT_MOON_2
	warp_to $f, $1b, MT_MOON_3_WIDTH ; MT_MOON_2
	warp_to $5, $7, MT_MOON_3_WIDTH ; MT_MOON_2
