Route5GateObject: ; 0x1dffb (size=42)
	db $a ; border block

	db $4 ; warps
	db $5, $3, $2, $ff
	db $5, $4, $2, $ff
	db $0, $3, $1, $ff
	db $0, $4, $0, $ff

	db $0 ; signs

	db $1 ; people
	db SPRITE_GUARD, $3 + 4, $1 + 4, $ff, $d3, $1 ; person

	; warp-to
	EVENT_DISP ROUTE_5_GATE_WIDTH, $5, $3
	EVENT_DISP ROUTE_5_GATE_WIDTH, $5, $4
	EVENT_DISP ROUTE_5_GATE_WIDTH, $0, $3
	EVENT_DISP ROUTE_5_GATE_WIDTH, $0, $4
