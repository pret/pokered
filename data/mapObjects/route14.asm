Route14Object:
	db $43 ; border block

	db $0 ; warps

	db $1 ; signs
	sign $11, $d, $b ; Route14Text11

	db $a ; objects
	object SPRITE_BLACK_HAIR_BOY_1, $4, $4, STAY, DOWN, $1, OPP_BIRD_KEEPER, $e
	object SPRITE_BLACK_HAIR_BOY_1, $f, $6, STAY, DOWN, $2, OPP_BIRD_KEEPER, $f
	object SPRITE_BLACK_HAIR_BOY_1, $c, $b, STAY, DOWN, $3, OPP_BIRD_KEEPER, $10
	object SPRITE_BLACK_HAIR_BOY_1, $e, $f, STAY, UP, $4, OPP_BIRD_KEEPER, $11
	object SPRITE_BLACK_HAIR_BOY_1, $f, $1f, STAY, LEFT, $5, OPP_BIRD_KEEPER, $4
	object SPRITE_BLACK_HAIR_BOY_1, $6, $31, STAY, UP, $6, OPP_BIRD_KEEPER, $5
	object SPRITE_BIKER, $5, $27, STAY, DOWN, $7, OPP_BIKER, $d
	object SPRITE_BIKER, $4, $1e, STAY, RIGHT, $8, OPP_BIKER, $e
	object SPRITE_BIKER, $f, $1e, STAY, LEFT, $9, OPP_BIKER, $f
	object SPRITE_BIKER, $4, $1f, STAY, RIGHT, $a, OPP_BIKER, $2
