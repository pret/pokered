Route18GateObject:
	db $a ; border block

	db $5 ; warps
	db $4, $0, $0, $ff
	db $5, $0, $1, $ff
	db $4, $7, $2, $ff
	db $5, $7, $3, $ff
	db $8, $6, $0, ROUTE_18_GATE_2F

	db $0 ; signs

	db $1 ; objects
	object SPRITE_GUARD, $4, $1, STAY, DOWN, $1 ; person

	; warp-to
	EVENT_DISP ROUTE_18_GATE_1F_WIDTH, $4, $0
	EVENT_DISP ROUTE_18_GATE_1F_WIDTH, $5, $0
	EVENT_DISP ROUTE_18_GATE_1F_WIDTH, $4, $7
	EVENT_DISP ROUTE_18_GATE_1F_WIDTH, $5, $7
	EVENT_DISP ROUTE_18_GATE_1F_WIDTH, $8, $6 ; ROUTE_18_GATE_2F
