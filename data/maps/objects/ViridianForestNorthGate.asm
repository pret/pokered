ViridianForestNorthGate_Object:
	db $a ; border block

	def_warps
	warp  4,  0, 1, LAST_MAP
	warp  5,  0, 1, LAST_MAP
	warp  4,  7, 0, VIRIDIAN_FOREST
	warp  5,  7, 0, VIRIDIAN_FOREST

	def_signs

	def_objects
	object SPRITE_SUPER_NERD, 3, 2, STAY, NONE, 1 ; person
	object SPRITE_GRAMPS, 2, 5, STAY, NONE, 2 ; person

	def_warps_to VIRIDIAN_FOREST_NORTH_GATE
