Route17Object:
	db $43 ; border block

	db $0 ; warps

	db $6 ; signs
	sign $9, $33, $b ; Route17Text11
	sign $9, $3f, $c ; Route17Text12
	sign $9, $4b, $d ; Route17Text13
	sign $9, $57, $e ; Route17Text14
	sign $9, $6f, $f ; Route17Text15
	sign $9, $8d, $10 ; Route17Text16

	db $a ; objects
	object SPRITE_BIKER, $c, $13, STAY, LEFT, $1, OPP_CUE_BALL, $4
	object SPRITE_BIKER, $b, $10, STAY, RIGHT, $2, OPP_CUE_BALL, $5
	object SPRITE_BIKER, $4, $12, STAY, UP, $3, OPP_BIKER, $8
	object SPRITE_BIKER, $7, $20, STAY, LEFT, $4, OPP_BIKER, $9
	object SPRITE_BIKER, $e, $22, STAY, RIGHT, $5, OPP_BIKER, $a
	object SPRITE_BIKER, $11, $3a, STAY, LEFT, $6, OPP_CUE_BALL, $6
	object SPRITE_BIKER, $2, $44, STAY, RIGHT, $7, OPP_CUE_BALL, $7
	object SPRITE_BIKER, $e, $62, STAY, RIGHT, $8, OPP_CUE_BALL, $8
	object SPRITE_BIKER, $5, $62, STAY, LEFT, $9, OPP_BIKER, $b
	object SPRITE_BIKER, $a, $76, STAY, DOWN, $a, OPP_BIKER, $c
