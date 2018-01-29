Route15GateObject:
	db $a ; border block

	db $5 ; warps
	warp $0, $4, $0, $ff
	warp $0, $5, $1, $ff
	warp $7, $4, $2, $ff
	warp $7, $5, $3, $ff
	warp $6, $8, $0, ROUTE_15_GATE_2F

	db $0 ; signs

	db $1 ; objects
	object SPRITE_GUARD, $4, $1, STAY, NONE, $1 ; person

	; warp-to
	warp_to $0, $4, ROUTE_15_GATE_1F_WIDTH
	warp_to $0, $5, ROUTE_15_GATE_1F_WIDTH
	warp_to $7, $4, ROUTE_15_GATE_1F_WIDTH
	warp_to $7, $5, ROUTE_15_GATE_1F_WIDTH
	warp_to $6, $8, ROUTE_15_GATE_1F_WIDTH ; ROUTE_15_GATE_2F
