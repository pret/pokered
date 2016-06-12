LavenderHouse1Object:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $2, $ff
	db $7, $3, $2, $ff

	db $0 ; signs

	db $6 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $3, $5, STAY, NONE, $1 ; person
	object SPRITE_LITTLE_GIRL, $6, $3, STAY, DOWN, $2 ; person
	object SPRITE_SLOWBRO, $6, $4, STAY, UP, $3 ; person
	object SPRITE_SLOWBRO, $1, $3, STAY, NONE, $4 ; person
	object SPRITE_MR_FUJI, $3, $1, STAY, NONE, $5 ; person
	object SPRITE_BOOK_MAP_DEX, $3, $3, STAY, NONE, $6 ; person

	; warp-to
	EVENT_DISP LAVENDER_HOUSE_1_WIDTH, $7, $2
	EVENT_DISP LAVENDER_HOUSE_1_WIDTH, $7, $3
