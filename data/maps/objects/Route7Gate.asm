Route7Gate_Object:
	db $a ; border block

	def_warps
	warp 0, 3, 3, LAST_MAP
	warp 0, 4, 3, LAST_MAP
	warp 5, 3, 0, LAST_MAP
	warp 5, 4, 1, LAST_MAP

	def_signs

	def_objects
	object SPRITE_GUARD, 3, 1, STAY, DOWN, 1 ; person

	; warp-to
	warp_to 0, 3, ROUTE_7_GATE_WIDTH
	warp_to 0, 4, ROUTE_7_GATE_WIDTH
	warp_to 5, 3, ROUTE_7_GATE_WIDTH
	warp_to 5, 4, ROUTE_7_GATE_WIDTH
