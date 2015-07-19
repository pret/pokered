Route17Object: ; 0x54b42 (size=102)
	db $43 ; border block

	db $0 ; warps

	db $6 ; signs
	db $33, $9, $b ; Route17Text11
	db $3f, $9, $c ; Route17Text12
	db $4b, $9, $d ; Route17Text13
	db $57, $9, $e ; Route17Text14
	db $6f, $9, $f ; Route17Text15
	db $8d, $9, $10 ; Route17Text16

	db $a ; objects
	object SPRITE_BIKER, $c, $13, FACE, RIGHT, $1, CUE_BALL + $C8, $4
	object SPRITE_BIKER, $b, $10, FACE, LEFT, $2, CUE_BALL + $C8, $5
	object SPRITE_BIKER, $4, $12, FACE, UP, $3, BIKER + $C8, $8
	object SPRITE_BIKER, $7, $20, FACE, RIGHT, $4, BIKER + $C8, $9
	object SPRITE_BIKER, $e, $22, FACE, LEFT, $5, BIKER + $C8, $a
	object SPRITE_BIKER, $11, $3a, FACE, RIGHT, $6, CUE_BALL + $C8, $6
	object SPRITE_BIKER, $2, $44, FACE, LEFT, $7, CUE_BALL + $C8, $7
	object SPRITE_BIKER, $e, $62, FACE, LEFT, $8, CUE_BALL + $C8, $8
	object SPRITE_BIKER, $5, $62, FACE, RIGHT, $9, BIKER + $C8, $b
	object SPRITE_BIKER, $a, $76, FACE, DOWN, $a, BIKER + $C8, $c
