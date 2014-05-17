CeladonHotelObject: ; 0x49281 (size=38)
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $c, $ff
	db $7, $4, $c, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_OLD_MEDIUM_WOMAN, $1 + 4, $3 + 4, $ff, $d0, $1 ; person
	db SPRITE_FOULARD_WOMAN, $4 + 4, $2 + 4, $ff, $ff, $2 ; person
	db SPRITE_BLACK_HAIR_BOY_2, $4 + 4, $8 + 4, $fe, $2, $3 ; person

	; warp-to
	EVENT_DISP CELADON_HOTEL_WIDTH, $7, $3
	EVENT_DISP CELADON_HOTEL_WIDTH, $7, $4
