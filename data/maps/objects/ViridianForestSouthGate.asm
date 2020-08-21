ViridianForestSouthGate_Object:
	db $a ; border block

	def_warps
	warp  4,  0, 3, VIRIDIAN_FOREST
	warp  5,  0, 4, VIRIDIAN_FOREST
	warp  4,  7, 5, LAST_MAP
	warp  5,  7, 5, LAST_MAP

	def_signs

	def_objects
	object SPRITE_GIRL, 8, 4, STAY, LEFT, 1 ; person
	object SPRITE_LITTLE_GIRL, 2, 4, WALK, UP_DOWN, 2 ; person

	def_warps_to VIRIDIAN_FOREST_SOUTH_GATE
