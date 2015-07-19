OaksLabObject: ; 0x1d40a (size=88)
	db $3 ; border block

	db $2 ; warps
	db $b, $4, $2, $ff
	db $b, $5, $2, $ff

	db $0 ; signs

	db $b ; objects
	object SPRITE_BLUE, $4, $3, FACE, STAY, $1, SONY1 + $C8, $1
	object SPRITE_BALL, $6, $3, FACE, STAY, $2 ; person
	object SPRITE_BALL, $7, $3, FACE, STAY, $3 ; person
	object SPRITE_BALL, $8, $3, FACE, STAY, $4 ; person
	object SPRITE_OAK, $5, $2, FACE, DOWN, $5 ; person
	object SPRITE_BOOK_MAP_DEX, $2, $1, FACE, STAY, $6 ; person
	object SPRITE_BOOK_MAP_DEX, $3, $1, FACE, STAY, $7 ; person
	object SPRITE_OAK, $5, $a, FACE, UP, $8 ; person
	object SPRITE_GIRL, $1, $9, WALK, $1, $9 ; person
	object SPRITE_OAK_AIDE, $2, $a, FACE, STAY, $a ; person
	object SPRITE_OAK_AIDE, $8, $a, FACE, STAY, $b ; person

	; warp-to
	EVENT_DISP OAKS_LAB_WIDTH, $b, $4
	EVENT_DISP OAKS_LAB_WIDTH, $b, $5
