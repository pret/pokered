Route12GateObject:
	db $a ; border block

	db $5 ; warps
	db $0, $4, $0, $ff
	db $0, $5, $1, $ff
	db $7, $4, $2, $ff
	db $7, $5, $2, $ff
	db $6, $8, $0, ROUTE_12_GATE_2F

	db $0 ; signs

	db $1 ; objects
	object SPRITE_GUARD, $1, $3, STAY, NONE, $1 ; person

	; warp-to
	EVENT_DISP ROUTE_12_GATE_1F_WIDTH, $0, $4
	EVENT_DISP ROUTE_12_GATE_1F_WIDTH, $0, $5
	EVENT_DISP ROUTE_12_GATE_1F_WIDTH, $7, $4
	EVENT_DISP ROUTE_12_GATE_1F_WIDTH, $7, $5
	EVENT_DISP ROUTE_12_GATE_1F_WIDTH, $6, $8 ; ROUTE_12_GATE_2F
