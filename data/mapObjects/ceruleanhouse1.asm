CeruleanHouse1Object: ; 0x1d710 (size=32)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $1, $ff
	db $7, $3, $1, $ff

	db $0 ; signs

	db $2 ; people
	db SPRITE_OLD_MEDIUM_WOMAN, $4 + 4, $5 + 4, $ff, $d2, $1 ; person
	db SPRITE_GAMBLER, $2 + 4, $1 + 4, $ff, $ff, $2 ; person

	; warp-to
	EVENT_DISP CERULEAN_HOUSE_1_WIDTH, $7, $2
	EVENT_DISP CERULEAN_HOUSE_1_WIDTH, $7, $3
