Route14Object: ; 0x549bb (size=87)
	db $43 ; border block

	db $0 ; warps

	db $1 ; signs
	db $d, $11, $b ; Route14Text11

	db $a ; objects
	object SPRITE_BLACK_HAIR_BOY_1, $4, $4, FACE, DOWN, $1, BIRD_KEEPER + $C8, $e
	object SPRITE_BLACK_HAIR_BOY_1, $f, $6, FACE, DOWN, $2, BIRD_KEEPER + $C8, $f
	object SPRITE_BLACK_HAIR_BOY_1, $c, $b, FACE, DOWN, $3, BIRD_KEEPER + $C8, $10
	object SPRITE_BLACK_HAIR_BOY_1, $e, $f, FACE, UP, $4, BIRD_KEEPER + $C8, $11
	object SPRITE_BLACK_HAIR_BOY_1, $f, $1f, FACE, RIGHT, $5, BIRD_KEEPER + $C8, $4
	object SPRITE_BLACK_HAIR_BOY_1, $6, $31, FACE, UP, $6, BIRD_KEEPER + $C8, $5
	object SPRITE_BIKER, $5, $27, FACE, DOWN, $7, BIKER + $C8, $d
	object SPRITE_BIKER, $4, $1e, FACE, LEFT, $8, BIKER + $C8, $e
	object SPRITE_BIKER, $f, $1e, FACE, RIGHT, $9, BIKER + $C8, $f
	object SPRITE_BIKER, $4, $1f, FACE, LEFT, $a, BIKER + $C8, $2
