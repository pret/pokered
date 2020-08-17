Route12Gate1F_Object:
	db $a ; border block

	def_warps
	warp 4, 0, 0, LAST_MAP
	warp 5, 0, 1, LAST_MAP
	warp 4, 7, 2, LAST_MAP
	warp 5, 7, 2, LAST_MAP
	warp 8, 6, 0, ROUTE_12_GATE_2F

	def_signs

	def_objects
	object SPRITE_GUARD, 1, 3, STAY, NONE, 1 ; person

	; warp-to
	warp_to 4, 0, ROUTE_12_GATE_1F_WIDTH
	warp_to 5, 0, ROUTE_12_GATE_1F_WIDTH
	warp_to 4, 7, ROUTE_12_GATE_1F_WIDTH
	warp_to 5, 7, ROUTE_12_GATE_1F_WIDTH
	warp_to 8, 6, ROUTE_12_GATE_1F_WIDTH ; ROUTE_12_GATE_2F
