SeafoamIslands1F_Object:
	db $7d ; border block

	def_warps
	warp  4, 17, 0, LAST_MAP
	warp  5, 17, 0, LAST_MAP
	warp 26, 17, 1, LAST_MAP
	warp 27, 17, 1, LAST_MAP
	warp  7,  5, 1, SEAFOAM_ISLANDS_B1F
	warp 25,  3, 6, SEAFOAM_ISLANDS_B1F
	warp 23, 15, 4, SEAFOAM_ISLANDS_B1F

	def_signs

	def_objects
	object SPRITE_BOULDER, 18, 10, STAY, BOULDER_MOVEMENT_BYTE_2, 1 ; person
	object SPRITE_BOULDER, 26, 7, STAY, BOULDER_MOVEMENT_BYTE_2, 2 ; person

	def_warps_to SEAFOAM_ISLANDS_1F

	; holes
	warp_to 17, 6, SEAFOAM_ISLANDS_1F_WIDTH
	warp_to 24, 6, SEAFOAM_ISLANDS_1F_WIDTH
