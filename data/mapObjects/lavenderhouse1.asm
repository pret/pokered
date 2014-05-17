LavenderHouse1Object: ; 0x1d96a (size=56)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $2, $ff
	db $7, $3, $2, $ff

	db $0 ; signs

	db $6 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $5 + 4, $3 + 4, $ff, $ff, $1 ; person
	db SPRITE_LITTLE_GIRL, $3 + 4, $6 + 4, $ff, $d0, $2 ; person
	db SPRITE_SLOWBRO, $4 + 4, $6 + 4, $ff, $d1, $3 ; person
	db SPRITE_SLOWBRO, $3 + 4, $1 + 4, $ff, $ff, $4 ; person
	db SPRITE_MR_FUJI, $1 + 4, $3 + 4, $ff, $ff, $5 ; person
	db SPRITE_BOOK_MAP_DEX, $3 + 4, $3 + 4, $ff, $ff, $6 ; person

	; warp-to
	EVENT_DISP LAVENDER_HOUSE_1_WIDTH, $7, $2
	EVENT_DISP LAVENDER_HOUSE_1_WIDTH, $7, $3
