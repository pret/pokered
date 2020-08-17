Route2Gate_Object:
	db $a ; border block

	def_warps
	warp 4, 0, 3, LAST_MAP
	warp 5, 0, 3, LAST_MAP
	warp 4, 7, 4, LAST_MAP
	warp 5, 7, 4, LAST_MAP

	def_signs

	def_objects
	object SPRITE_SCIENTIST, 1, 4, STAY, LEFT, 1 ; person
	object SPRITE_YOUNGSTER, 5, 4, WALK, LEFT_RIGHT, 2 ; person

	; warp-to
	warp_to 4, 0, ROUTE_2_GATE_WIDTH
	warp_to 5, 0, ROUTE_2_GATE_WIDTH
	warp_to 4, 7, ROUTE_2_GATE_WIDTH
	warp_to 5, 7, ROUTE_2_GATE_WIDTH
