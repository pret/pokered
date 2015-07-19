Route6GateObject: ; 0x1e0be (size=42)
	db $a ; border block

	db $4 ; warps
	db $5, $3, $2, $ff
	db $5, $4, $2, $ff
	db $0, $3, $1, $ff
	db $0, $4, $1, $ff

	db $0 ; signs

	db $1 ; objects
	object SPRITE_GUARD, $6, $2, FACE, RIGHT, $1 ; person

	; warp-to
	EVENT_DISP ROUTE_6_GATE_WIDTH, $5, $3
	EVENT_DISP ROUTE_6_GATE_WIDTH, $5, $4
	EVENT_DISP ROUTE_6_GATE_WIDTH, $0, $3
	EVENT_DISP ROUTE_6_GATE_WIDTH, $0, $4
