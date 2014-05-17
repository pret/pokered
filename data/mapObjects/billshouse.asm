BillsHouseObject: ; 0x1e8df (size=38)
	db $d ; border block

	db $2 ; warps
	db $7, $2, $0, $ff
	db $7, $3, $0, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_SLOWBRO, $5 + 4, $6 + 4, $ff, $ff, $1 ; person
	db SPRITE_BLACK_HAIR_BOY_2, $4 + 4, $4 + 4, $ff, $ff, $2 ; person
	db SPRITE_BLACK_HAIR_BOY_2, $5 + 4, $6 + 4, $ff, $ff, $3 ; person

	; warp-to
	EVENT_DISP BILLS_HOUSE_WIDTH, $7, $2
	EVENT_DISP BILLS_HOUSE_WIDTH, $7, $3
