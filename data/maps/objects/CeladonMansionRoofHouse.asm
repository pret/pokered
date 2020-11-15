CeladonMansionRoofHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 2, CELADON_MANSION_ROOF
	warp  3,  7, 2, CELADON_MANSION_ROOF

	def_signs

	def_objects
	object SPRITE_HIKER, 2, 2, STAY, DOWN, 1 ; person
	object SPRITE_POKE_BALL, 4, 3, STAY, NONE, 2 ; person

	def_warps_to CELADON_MANSION_ROOF_HOUSE
