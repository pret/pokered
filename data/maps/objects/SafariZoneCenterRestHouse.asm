SafariZoneCenterRestHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 8, SAFARI_ZONE_CENTER
	warp  3,  7, 8, SAFARI_ZONE_CENTER

	def_signs

	def_objects
	object SPRITE_GIRL, 3, 2, STAY, DOWN, 1 ; person
	object SPRITE_SCIENTIST, 1, 4, WALK, UP_DOWN, 2 ; person

	def_warps_to SAFARI_ZONE_CENTER_REST_HOUSE
