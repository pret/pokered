Route16Gate1F_Object:
	db $a ; border block

	def_warps
	warp 0, 8, 0, LAST_MAP
	warp 0, 9, 1, LAST_MAP
	warp 7, 8, 2, LAST_MAP
	warp 7, 9, 2, LAST_MAP
	warp 0, 2, 4, LAST_MAP
	warp 0, 3, 5, LAST_MAP
	warp 7, 2, 6, LAST_MAP
	warp 7, 3, 7, LAST_MAP
	warp 6, 12, 0, ROUTE_16_GATE_2F

	def_signs

	def_objects
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
