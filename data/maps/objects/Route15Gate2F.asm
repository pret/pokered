Route15Gate2F_Object:
	db $a ; border block

	def_warps
	warp 7, 7, 4, ROUTE_15_GATE_1F

	def_signs
	sign 6, 2, 2 ; Route15GateUpstairsText2

	def_objects
	object SPRITE_SCIENTIST, 4, 2, STAY, DOWN, 1

	; warp-to
	warp_to 7, 7, ROUTE_15_GATE_2F_WIDTH ; ROUTE_15_GATE_1F
