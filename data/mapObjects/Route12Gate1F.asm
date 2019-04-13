Route12Gate1F_Object:
	db $a ; border block

	db 5 ; warps
	warp 4, 0, 0, -1
	warp 5, 0, 1, -1
	warp 4, 7, 2, -1
	warp 5, 7, 2, -1
	warp 8, 6, 0, ROUTE_12_GATE_2F

	db 0 ; signs

	db 1 ; objects
	object SPRITE_GUARD, 1, 3, STAY, NONE, 1 ; person

	; warp-to
	warp_to 4, 0, ROUTE_12_GATE_1F_WIDTH
	warp_to 5, 0, ROUTE_12_GATE_1F_WIDTH
	warp_to 4, 7, ROUTE_12_GATE_1F_WIDTH
	warp_to 5, 7, ROUTE_12_GATE_1F_WIDTH
	warp_to 8, 6, ROUTE_12_GATE_1F_WIDTH ; ROUTE_12_GATE_2F
