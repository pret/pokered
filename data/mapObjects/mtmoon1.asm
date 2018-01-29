MtMoon1Object:
	db $3 ; border block

	db $5 ; warps
	warp $e, $23, $1, $ff
	warp $f, $23, $1, $ff
	warp $5, $5, $0, MT_MOON_2
	warp $11, $b, $2, MT_MOON_2
	warp $19, $f, $3, MT_MOON_2

	db $1 ; signs
	sign $f, $17, $e ; MtMoon1Text14

	db $d ; objects
	object SPRITE_HIKER, $5, $6, STAY, DOWN, $1, OPP_HIKER, $1
	object SPRITE_BUG_CATCHER, $c, $10, STAY, RIGHT, $2, OPP_YOUNGSTER, $3
	object SPRITE_LASS, $1e, $4, STAY, DOWN, $3, OPP_LASS, $5
	object SPRITE_BLACK_HAIR_BOY_2, $18, $1f, STAY, UP, $4, OPP_SUPER_NERD, $1
	object SPRITE_LASS, $10, $17, STAY, DOWN, $5, OPP_LASS, $6
	object SPRITE_BUG_CATCHER, $7, $16, STAY, DOWN, $6, OPP_BUG_CATCHER, $7
	object SPRITE_BUG_CATCHER, $1e, $1b, STAY, RIGHT, $7, OPP_BUG_CATCHER, $8
	object SPRITE_BALL, $2, $14, STAY, NONE, $8, POTION
	object SPRITE_BALL, $2, $2, STAY, NONE, $9, MOON_STONE
	object SPRITE_BALL, $23, $1f, STAY, NONE, $a, RARE_CANDY
	object SPRITE_BALL, $24, $17, STAY, NONE, $b, ESCAPE_ROPE
	object SPRITE_BALL, $14, $21, STAY, NONE, $c, POTION
	object SPRITE_BALL, $5, $20, STAY, NONE, $d, TM_12

	; warp-to
	warp_to $e, $23, MT_MOON_1_WIDTH
	warp_to $f, $23, MT_MOON_1_WIDTH
	warp_to $5, $5, MT_MOON_1_WIDTH ; MT_MOON_2
	warp_to $11, $b, MT_MOON_1_WIDTH ; MT_MOON_2
	warp_to $19, $f, MT_MOON_1_WIDTH ; MT_MOON_2
