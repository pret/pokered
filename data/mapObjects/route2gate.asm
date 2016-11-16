Route2GateObject:
	db $a ; border block

	db $4 ; warps
	db $0, $4, $3, $ff
	db $0, $5, $3, $ff
	db $7, $4, $4, $ff
	db $7, $5, $4, $ff

	db $0 ; signs

	db $2 ; objects
	object SPRITE_OAK_AIDE, $1, $4, STAY, LEFT, $1 ; person
	object SPRITE_BUG_CATCHER, $5, $4, WALK, $2, $2 ; person

	; warp-to
	EVENT_DISP ROUTE_2_GATE_WIDTH, $0, $4
	EVENT_DISP ROUTE_2_GATE_WIDTH, $0, $5
	EVENT_DISP ROUTE_2_GATE_WIDTH, $7, $4
	EVENT_DISP ROUTE_2_GATE_WIDTH, $7, $5
