Mansion3Object: ; 0x522e6 (size=64)
	db $1 ; border block

	db $3 ; warps
	db $a, $7, $1, MANSION_2
	db $1, $6, $3, MANSION_2
	db $e, $19, $2, MANSION_2

	db $0 ; signs

	db $5 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $5, $b, WALK, $2, $1, BURGLAR + $C8, $8
	object SPRITE_OAK_AIDE, $14, $b, STAY, LEFT, $2, SCIENTIST + $C8, $c
	object SPRITE_BALL, $1, $10, STAY, NONE, $3, MAX_POTION
	object SPRITE_BALL, $19, $5, STAY, NONE, $4, IRON
	object SPRITE_BOOK_MAP_DEX, $6, $c, STAY, NONE, $5 ; person

	; warp-to
	EVENT_DISP MANSION_3_WIDTH, $a, $7 ; MANSION_2
	EVENT_DISP MANSION_3_WIDTH, $1, $6 ; MANSION_2
	EVENT_DISP MANSION_3_WIDTH, $e, $19 ; MANSION_2
