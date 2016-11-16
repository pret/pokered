Route24Object:
	db $2c ; border block

	db $0 ; warps

	db $0 ; signs

	db $8 ; objects
	object SPRITE_BLACK_HAIR_BOY_1, $b, $f, STAY, LEFT, $1, ROCKET, $6
	object SPRITE_BLACK_HAIR_BOY_1, $5, $14, STAY, UP, $2, JR_TRAINER_M, $2
	object SPRITE_BLACK_HAIR_BOY_1, $b, $13, STAY, LEFT, $3, JR_TRAINER_M, $3
	object SPRITE_LASS, $a, $16, STAY, RIGHT, $4, LASS, $7
	object SPRITE_BUG_CATCHER, $b, $19, STAY, LEFT, $5, YOUNGSTER, $4
	object SPRITE_LASS, $a, $1c, STAY, RIGHT, $6, LASS, $8
	object SPRITE_BUG_CATCHER, $b, $1f, STAY, LEFT, $7, BUG_CATCHER, $9
	object SPRITE_BALL, $a, $5, STAY, NONE, $8, TM_45
