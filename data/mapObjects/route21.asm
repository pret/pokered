Route21Object:
	db $43 ; border block

	db $0 ; warps

	db $0 ; signs

	db $9 ; objects
	object SPRITE_FISHER2, $4, $18, STAY, LEFT, $1, FISHER, $7
	object SPRITE_FISHER2, $6, $19, STAY, DOWN, $2, FISHER, $9
	object SPRITE_SWIMMER, $a, $1f, STAY, UP, $3, SWIMMER, $c
	object SPRITE_SWIMMER, $c, $1e, STAY, RIGHT, $4, CUE_BALL, $9
	object SPRITE_SWIMMER, $10, $3f, STAY, DOWN, $5, SWIMMER, $d
	object SPRITE_SWIMMER, $5, $47, STAY, RIGHT, $6, SWIMMER, $e
	object SPRITE_SWIMMER, $f, $47, STAY, LEFT, $7, SWIMMER, $f
	object SPRITE_FISHER2, $e, $38, STAY, LEFT, $8, FISHER, $8
	object SPRITE_FISHER2, $11, $39, STAY, RIGHT, $9, FISHER, $a
