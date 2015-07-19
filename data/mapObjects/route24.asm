Route24Object: ; 0x506a4 (size=67)
	db $2c ; border block

	db $0 ; warps

	db $0 ; signs

	db $8 ; objects
	object SPRITE_BLACK_HAIR_BOY_1, $b, $f, FACE, RIGHT, $1, ROCKET + $C8, $6
	object SPRITE_BLACK_HAIR_BOY_1, $5, $14, FACE, UP, $2, JR__TRAINER_M + $C8, $2
	object SPRITE_BLACK_HAIR_BOY_1, $b, $13, FACE, RIGHT, $3, JR__TRAINER_M + $C8, $3
	object SPRITE_LASS, $a, $16, FACE, LEFT, $4, LASS + $C8, $7
	object SPRITE_BUG_CATCHER, $b, $19, FACE, RIGHT, $5, YOUNGSTER + $C8, $4
	object SPRITE_LASS, $a, $1c, FACE, LEFT, $6, LASS + $C8, $8
	object SPRITE_BUG_CATCHER, $b, $1f, FACE, RIGHT, $7, BUG_CATCHER + $C8, $9
	object SPRITE_BALL, $a, $5, FACE, STAY, $8, TM_45
