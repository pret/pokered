VermilionHouse1Object: ; 0x1db20 (size=38)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $4, $ff
	db $7, $3, $4, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_BUG_CATCHER, $3 + 4, $5 + 4, $ff, $d2, $1 ; person
	db SPRITE_BIRD, $5 + 4, $3 + 4, $fe, $2, $2 ; person
	db SPRITE_PAPER_SHEET, $3 + 4, $4 + 4, $ff, $ff, $3 ; person

	; warp-to
	EVENT_DISP VERMILION_HOUSE_1_WIDTH, $7, $2
	EVENT_DISP VERMILION_HOUSE_1_WIDTH, $7, $3
