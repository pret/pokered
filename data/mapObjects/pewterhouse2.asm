PewterHouse2Object: ; 0x1d659 (size=32)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $5, $ff
	db $7, $3, $5, $ff

	db $0 ; signs

	db $2 ; people
	db SPRITE_GAMBLER, $3 + 4, $2 + 4, $ff, $d3, $1 ; person
	db SPRITE_BUG_CATCHER, $5 + 4, $4 + 4, $ff, $ff, $2 ; person

	; warp-to
	EVENT_DISP PEWTER_HOUSE_2_WIDTH, $7, $2
	EVENT_DISP PEWTER_HOUSE_2_WIDTH, $7, $3
