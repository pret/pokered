Route9Object: ; 0x546a8 (size=86)
	db $2c ; border block

	db $0 ; warps

	db $1 ; signs
	db $7, $19, $b ; Route9Text11

	db $a ; objects
	object SPRITE_LASS, $d, $a, FACE, RIGHT, $1, JR__TRAINER_F + $C8, $5
	object SPRITE_BLACK_HAIR_BOY_1, $18, $7, FACE, RIGHT, $2, JR__TRAINER_M + $C8, $7
	object SPRITE_BLACK_HAIR_BOY_1, $1f, $7, FACE, LEFT, $3, JR__TRAINER_M + $C8, $8
	object SPRITE_LASS, $30, $8, FACE, LEFT, $4, JR__TRAINER_F + $C8, $6
	object SPRITE_HIKER, $10, $f, FACE, RIGHT, $5, HIKER + $C8, $b
	object SPRITE_HIKER, $2b, $3, FACE, RIGHT, $6, HIKER + $C8, $6
	object SPRITE_BUG_CATCHER, $16, $2, FACE, DOWN, $7, BUG_CATCHER + $C8, $d
	object SPRITE_HIKER, $2d, $f, FACE, LEFT, $8, HIKER + $C8, $5
	object SPRITE_BUG_CATCHER, $28, $8, FACE, LEFT, $9, BUG_CATCHER + $C8, $e
	object SPRITE_BALL, $a, $f, FACE, STAY, $a, TM_30
