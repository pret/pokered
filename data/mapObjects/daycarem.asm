DayCareMObject: ; 0x56459 (size=26)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $4, $ff
	db $7, $3, $4, $ff

	db $0 ; signs

	db $1 ; people
	db SPRITE_GENTLEMAN, $3 + 4, $2 + 4, $ff, $d3, $1 ; person

	; warp-to
	EVENT_DISP DAYCAREM_WIDTH, $7, $2
	EVENT_DISP DAYCAREM_WIDTH, $7, $3
