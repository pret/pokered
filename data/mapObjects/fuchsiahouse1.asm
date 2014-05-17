FuchsiaHouse1Object: ; 0x75031 (size=38)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $1, $ff
	db $7, $3, $1, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_MOM_GEISHA, $3 + 4, $2 + 4, $ff, $d3, $1 ; person
	db SPRITE_GAMBLER, $2 + 4, $7 + 4, $ff, $d1, $2 ; person
	db SPRITE_BUG_CATCHER, $5 + 4, $5 + 4, $ff, $ff, $3 ; person

	; warp-to
	EVENT_DISP FUCHSIA_HOUSE_1_WIDTH, $7, $2
	EVENT_DISP FUCHSIA_HOUSE_1_WIDTH, $7, $3
