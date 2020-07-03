Route16Gate1F_Object:
	db $a ; border block

	db 9 ; warps
	warp 0, 8, 0, -1
	warp 0, 9, 1, -1
	warp 7, 8, 2, -1
	warp 7, 9, 2, -1
	warp 0, 2, 4, -1
	warp 0, 3, 5, -1
	warp 7, 2, 6, -1
	warp 7, 3, 7, -1
	warp 6, 12, 0, ROUTE_16_GATE_2F

	db 0 ; signs

	db 2 ; objects
	object SPRITE_GUARD, 4, 5, STAY, DOWN, 1 ; person
	object SPRITE_GAMBLER, 4, 3, STAY, NONE, 2 ; person

	; warp-to
	warp_to 0, 8, ROUTE_16_GATE_1F_WIDTH
	warp_to 0, 9, ROUTE_16_GATE_1F_WIDTH
	warp_to 7, 8, ROUTE_16_GATE_1F_WIDTH
	warp_to 7, 9, ROUTE_16_GATE_1F_WIDTH
	warp_to 0, 2, ROUTE_16_GATE_1F_WIDTH
	warp_to 0, 3, ROUTE_16_GATE_1F_WIDTH
	warp_to 7, 2, ROUTE_16_GATE_1F_WIDTH
	warp_to 7, 3, ROUTE_16_GATE_1F_WIDTH
	warp_to 6, 12, ROUTE_16_GATE_1F_WIDTH ; ROUTE_16_GATE_2F
