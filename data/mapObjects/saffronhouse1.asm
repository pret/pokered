SaffronHouse1Object: ; 0x1de04 (size=44)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $3, $ff
	db $7, $3, $3, $ff

	db $0 ; signs

	db $4 ; people
	db SPRITE_BRUNETTE_GIRL, $3 + 4, $2 + 4, $ff, $d3, $1 ; person
	db SPRITE_BIRD, $4 + 4, $0 + 4, $fe, $1, $2 ; person
	db SPRITE_BUG_CATCHER, $1 + 4, $4 + 4, $ff, $d0, $3 ; person
	db SPRITE_PAPER_SHEET, $3 + 4, $3 + 4, $ff, $ff, $4 ; person

	; warp-to
	EVENT_DISP SAFFRON_HOUSE_1_WIDTH, $7, $2
	EVENT_DISP SAFFRON_HOUSE_1_WIDTH, $7, $3
