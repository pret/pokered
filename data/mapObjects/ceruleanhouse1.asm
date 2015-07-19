CeruleanHouse1Object: ; 0x1d710 (size=32)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $1, $ff
	db $7, $3, $1, $ff

	db $0 ; signs

	db $2 ; objects
	object SPRITE_OLD_MEDIUM_WOMAN, $5, $4, STAY, LEFT, $1 ; person
	object SPRITE_GAMBLER, $1, $2, STAY, NONE, $2 ; person

	; warp-to
	EVENT_DISP CERULEAN_HOUSE_1_WIDTH, $7, $2
	EVENT_DISP CERULEAN_HOUSE_1_WIDTH, $7, $3
