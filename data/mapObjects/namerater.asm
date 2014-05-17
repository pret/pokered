NameRaterObject: ; 0x1dad6 (size=26)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $5, $ff
	db $7, $3, $5, $ff

	db $0 ; signs

	db $1 ; people
	db SPRITE_MR_MASTERBALL, $3 + 4, $5 + 4, $ff, $d2, $1 ; person

	; warp-to
	EVENT_DISP NAME_RATERS_HOUSE_WIDTH, $7, $2
	EVENT_DISP NAME_RATERS_HOUSE_WIDTH, $7, $3
