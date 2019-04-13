Route15Gate2F_Object:
	db $a ; border block

	db 1 ; warps
	warp 7, 7, 4, ROUTE_15_GATE_1F

	db 1 ; signs
	sign 6, 2, 2 ; Route15GateUpstairsText2

	db 1 ; objects
	object SPRITE_OAK_AIDE, 4, 2, STAY, DOWN, 1

	; warp-to
	warp_to 7, 7, ROUTE_15_GATE_2F_WIDTH ; ROUTE_15_GATE_1F
