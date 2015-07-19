Route21Object: ; 0x55021 (size=76)
	db $43 ; border block

	db $0 ; warps

	db $0 ; signs

	db $9 ; objects
	object SPRITE_FISHER2, $4, $18, FACE, RIGHT, $1, FISHER + $C8, $7
	object SPRITE_FISHER2, $6, $19, FACE, DOWN, $2, FISHER + $C8, $9
	object SPRITE_SWIMMER, $a, $1f, FACE, UP, $3, SWIMMER + $C8, $c
	object SPRITE_SWIMMER, $c, $1e, FACE, LEFT, $4, CUE_BALL + $C8, $9
	object SPRITE_SWIMMER, $10, $3f, FACE, DOWN, $5, SWIMMER + $C8, $d
	object SPRITE_SWIMMER, $5, $47, FACE, LEFT, $6, SWIMMER + $C8, $e
	object SPRITE_SWIMMER, $f, $47, FACE, RIGHT, $7, SWIMMER + $C8, $f
	object SPRITE_FISHER2, $e, $38, FACE, RIGHT, $8, FISHER + $C8, $8
	object SPRITE_FISHER2, $11, $39, FACE, LEFT, $9, FISHER + $C8, $a
