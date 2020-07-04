Route2Gate_Object:
	db $a ; border block

	db 4 ; warps
	warp 4, 0, 3, -1
	warp 5, 0, 3, -1
	warp 4, 7, 4, -1
	warp 5, 7, 4, -1

	db 0 ; signs

	db 2 ; objects
	object SPRITE_OAK_AIDE, 1, 4, STAY, LEFT, 1 ; person
	object SPRITE_BUG_CATCHER, 5, 4, WALK, 2, 2 ; person

	; warp-to
	warp_to 4, 0, ROUTE_2_GATE_WIDTH
	warp_to 5, 0, ROUTE_2_GATE_WIDTH
	warp_to 4, 7, ROUTE_2_GATE_WIDTH
	warp_to 5, 7, ROUTE_2_GATE_WIDTH
