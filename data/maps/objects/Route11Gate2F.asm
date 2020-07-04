Route11Gate2F_Object:
	db $a ; border block

	db 1 ; warps
	warp 7, 7, 4, ROUTE_11_GATE_1F

	db 2 ; signs
	sign 1, 2, 3 ; Route11GateUpstairsText3
	sign 6, 2, 4 ; Route11GateUpstairsText4

	db 2 ; objects
	object SPRITE_BUG_CATCHER, 4, 2, WALK, 2, 1 ; person
	object SPRITE_OAK_AIDE, 2, 6, STAY, NONE, 2 ; person

	; warp-to
	warp_to 7, 7, ROUTE_11_GATE_2F_WIDTH ; ROUTE_11_GATE_1F
