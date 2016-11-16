Route13Object:
	db $43 ; border block

	db $0 ; warps

	db $3 ; signs
	db $d, $f, $b ; Route13Text11
	db $5, $21, $c ; Route13Text12
	db $b, $1f, $d ; Route13Text13

	db $a ; objects
	object SPRITE_BLACK_HAIR_BOY_1, $31, $a, STAY, RIGHT, $1, BIRD_KEEPER, $1
	object SPRITE_LASS, $30, $a, STAY, DOWN, $2, JR_TRAINER_F, $c
	object SPRITE_LASS, $1b, $9, STAY, DOWN, $3, JR_TRAINER_F, $d
	object SPRITE_LASS, $17, $a, STAY, LEFT, $4, JR_TRAINER_F, $e
	object SPRITE_LASS, $32, $5, STAY, DOWN, $5, JR_TRAINER_F, $f
	object SPRITE_BLACK_HAIR_BOY_1, $c, $4, STAY, RIGHT, $6, BIRD_KEEPER, $2
	object SPRITE_FOULARD_WOMAN, $21, $6, STAY, DOWN, $7, BEAUTY, $4
	object SPRITE_FOULARD_WOMAN, $20, $6, STAY, DOWN, $8, BEAUTY, $5
	object SPRITE_BIKER, $a, $7, STAY, UP, $9, BIKER, $1
	object SPRITE_BLACK_HAIR_BOY_1, $7, $d, STAY, UP, $a, BIRD_KEEPER, $3
