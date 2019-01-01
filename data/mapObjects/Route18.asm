Route18_Object:
	db $43 ; border block

	db 4 ; warps
	warp 33, 8, 0, ROUTE_18_GATE_1F
	warp 33, 9, 1, ROUTE_18_GATE_1F
	warp 40, 8, 2, ROUTE_18_GATE_1F
	warp 40, 9, 3, ROUTE_18_GATE_1F

	db 2 ; signs
	sign 43, 7, 4 ; Route18Text4
	sign 33, 5, 5 ; Route18Text5

	db 3 ; objects
	object SPRITE_BLACK_HAIR_BOY_1, 36, 11, STAY, RIGHT, 1, OPP_BIRD_KEEPER, 8
	object SPRITE_BLACK_HAIR_BOY_1, 40, 15, STAY, LEFT, 2, OPP_BIRD_KEEPER, 9
	object SPRITE_BLACK_HAIR_BOY_1, 42, 13, STAY, LEFT, 3, OPP_BIRD_KEEPER, 10

	; warp-to
	warp_to 33, 8, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F
	warp_to 33, 9, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F
	warp_to 40, 8, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F
	warp_to 40, 9, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F
