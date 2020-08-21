SeafoamIslandsB2F_Object:
	db $7d ; border block

	def_warps
	warp  5,  3, 0, SEAFOAM_ISLANDS_B1F
	warp  5, 13, 0, SEAFOAM_ISLANDS_B3F
	warp 13,  7, 2, SEAFOAM_ISLANDS_B1F
	warp 19, 15, 3, SEAFOAM_ISLANDS_B1F
	warp 25,  3, 3, SEAFOAM_ISLANDS_B3F
	warp 25, 11, 5, SEAFOAM_ISLANDS_B1F
	warp 25, 14, 4, SEAFOAM_ISLANDS_B3F

	def_signs

	def_objects
	object SPRITE_BOULDER, 18, 6, STAY, BOULDER_MOVEMENT_BYTE_2, 1 ; person
	object SPRITE_BOULDER, 23, 6, STAY, BOULDER_MOVEMENT_BYTE_2, 2 ; person

	def_warps_to SEAFOAM_ISLANDS_B2F
