Route22GateObject: ; 0x1e720 (size=42)
	db $a ; border block

	db $4 ; warps
	db $7, $4, $0, $ff
	db $7, $5, $0, $ff
	db $0, $4, $0, $ff
	db $0, $5, $1, $ff

	db $0 ; signs

	db $1 ; people
	db SPRITE_GUARD, $2 + 4, $6 + 4, $ff, $d2, $1 ; person

	; warp-to
	EVENT_DISP ROUTE_22_GATE_WIDTH, $7, $4
	EVENT_DISP ROUTE_22_GATE_WIDTH, $7, $5
	EVENT_DISP ROUTE_22_GATE_WIDTH, $0, $4
	EVENT_DISP ROUTE_22_GATE_WIDTH, $0, $5
