Route9Object:
	db $2c ; border block

	db $0 ; warps

	db $1 ; signs
	sign $19, $7, $b ; Route9Text11

	db $a ; objects
	object SPRITE_LASS, $d, $a, STAY, LEFT, $1, OPP_JR_TRAINER_F, $5
	object SPRITE_BLACK_HAIR_BOY_1, $18, $7, STAY, LEFT, $2, OPP_JR_TRAINER_M, $7
	object SPRITE_BLACK_HAIR_BOY_1, $1f, $7, STAY, RIGHT, $3, OPP_JR_TRAINER_M, $8
	object SPRITE_LASS, $30, $8, STAY, RIGHT, $4, OPP_JR_TRAINER_F, $6
	object SPRITE_HIKER, $10, $f, STAY, LEFT, $5, OPP_HIKER, $b
	object SPRITE_HIKER, $2b, $3, STAY, LEFT, $6, OPP_HIKER, $6
	object SPRITE_BUG_CATCHER, $16, $2, STAY, DOWN, $7, OPP_BUG_CATCHER, $d
	object SPRITE_HIKER, $2d, $f, STAY, RIGHT, $8, OPP_HIKER, $5
	object SPRITE_BUG_CATCHER, $28, $8, STAY, RIGHT, $9, OPP_BUG_CATCHER, $e
	object SPRITE_BALL, $a, $f, STAY, NONE, $a, TM_30
