Route18Gate2F_Object:
	db $a ; border block

	db 1 ; warps
	warp 7, 7, 4, ROUTE_18_GATE_1F

	db 2 ; signs
	sign 1, 2, 2 ; Route18GateUpstairsText2
	sign 6, 2, 3 ; Route18GateUpstairsText3

	db 1 ; objects
	object SPRITE_BUG_CATCHER, 4, 2, WALK, 2, 1 ; person

	; warp-to
	warp_to 7, 7, ROUTE_18_GATE_2F_WIDTH ; ROUTE_18_GATE_1F
