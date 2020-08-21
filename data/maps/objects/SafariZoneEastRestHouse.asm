SafariZoneEastRestHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 4, SAFARI_ZONE_EAST
	warp  3,  7, 4, SAFARI_ZONE_EAST

	def_signs

	def_objects
	object SPRITE_SCIENTIST, 1, 3, WALK, UP_DOWN, 1 ; person
	object SPRITE_ROCKER, 4, 2, STAY, NONE, 2 ; person
	object SPRITE_SILPH_WORKER, 5, 2, STAY, NONE, 3 ; person

	def_warps_to SAFARI_ZONE_EAST_REST_HOUSE
