Route16Gate2F_Object:
	db $a ; border block

	db 1 ; warps
	warp 7, 7, 8, ROUTE_16_GATE_1F

	db 2 ; signs
	sign 1, 2, 3 ; Route16GateUpstairsText3
	sign 6, 2, 4 ; Route16GateUpstairsText4

	db 2 ; objects
	object SPRITE_YOUNG_BOY, 4, 2, STAY, NONE, 1 ; person
	object SPRITE_LITTLE_GIRL, 2, 5, WALK, 2, 2 ; person

	; warp-to
	warp_to 7, 7, ROUTE_16_GATE_2F_WIDTH ; ROUTE_16_GATE_1F
