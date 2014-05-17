Route2GateObject: ; 0x5d620 (size=48)
	db $a ; border block

	db $4 ; warps
	db $0, $4, $3, $ff
	db $0, $5, $3, $ff
	db $7, $4, $4, $ff
	db $7, $5, $4, $ff

	db $0 ; signs

	db $2 ; people
	db SPRITE_OAK_AIDE, $4 + 4, $1 + 4, $ff, $d2, $1 ; person
	db SPRITE_BUG_CATCHER, $4 + 4, $5 + 4, $fe, $2, $2 ; person

	; warp-to
	EVENT_DISP ROUTE_2_GATE_WIDTH, $0, $4
	EVENT_DISP ROUTE_2_GATE_WIDTH, $0, $5
	EVENT_DISP ROUTE_2_GATE_WIDTH, $7, $4
	EVENT_DISP ROUTE_2_GATE_WIDTH, $7, $5
