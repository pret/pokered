SafariZoneNorthRestHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 8, SAFARI_ZONE_NORTH
	warp  3,  7, 8, SAFARI_ZONE_NORTH

	def_signs

	def_objects
	object SPRITE_SCIENTIST, 6, 3, WALK, LEFT_RIGHT, 1 ; person
	object SPRITE_SAFARI_ZONE_WORKER, 3, 4, STAY, NONE, 2 ; person
	object SPRITE_GENTLEMAN, 1, 5, WALK, UP_DOWN, 3 ; person

	def_warps_to SAFARI_ZONE_NORTH_REST_HOUSE
