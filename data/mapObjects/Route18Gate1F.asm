Route18Gate1F_Object:
	db $a ; border block

	db 5 ; warps
	warp 0, 4, 0, -1
	warp 0, 5, 1, -1
	warp 7, 4, 2, -1
	warp 7, 5, 3, -1
	warp 6, 8, 0, ROUTE_18_GATE_2F

	db 0 ; signs

	db 1 ; objects
	object SPRITE_GUARD, 4, 1, STAY, DOWN, 1 ; person

	; warp-to
	warp_to 0, 4, ROUTE_18_GATE_1F_WIDTH
	warp_to 0, 5, ROUTE_18_GATE_1F_WIDTH
	warp_to 7, 4, ROUTE_18_GATE_1F_WIDTH
	warp_to 7, 5, ROUTE_18_GATE_1F_WIDTH
	warp_to 6, 8, ROUTE_18_GATE_1F_WIDTH ; ROUTE_18_GATE_2F
