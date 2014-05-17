CeladonDinerObject: ; 0x491bc (size=50)
	db $f ; border block

	db $2 ; warps
	db $7, $3, $a, $ff
	db $7, $4, $a, $ff

	db $0 ; signs

	db $5 ; people
	db SPRITE_COOK, $5 + 4, $8 + 4, $fe, $2, $1 ; person
	db SPRITE_MOM_GEISHA, $2 + 4, $7 + 4, $ff, $ff, $2 ; person
	db SPRITE_FAT_BALD_GUY, $4 + 4, $1 + 4, $ff, $d0, $3 ; person
	db SPRITE_FISHER2, $3 + 4, $5 + 4, $ff, $d3, $4 ; person
	db SPRITE_GYM_HELPER, $1 + 4, $0 + 4, $ff, $d0, $5 ; person

	; warp-to
	EVENT_DISP CELADON_DINER_WIDTH, $7, $3
	EVENT_DISP CELADON_DINER_WIDTH, $7, $4
