Route22_Object:
	db $2c ; border block

	db 1 ; warps
	warp 8, 5, 0, ROUTE_22_GATE

	db 1 ; signs
	sign 7, 11, 3 ; Route22FrontGateText

	db 2 ; objects
	object SPRITE_BLUE, 25, 5, STAY, NONE, 1 ; person
	object SPRITE_BLUE, 25, 5, STAY, NONE, 2 ; person

	; warp-to
	warp_to 8, 5, ROUTE_22_WIDTH ; ROUTE_22_GATE
