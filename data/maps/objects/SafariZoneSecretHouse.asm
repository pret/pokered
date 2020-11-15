SafariZoneSecretHouse_Object:
	db $17 ; border block

	def_warps
	warp  2,  7, 6, SAFARI_ZONE_WEST
	warp  3,  7, 6, SAFARI_ZONE_WEST

	def_signs

	def_objects
	object SPRITE_FISHING_GURU, 3, 3, STAY, DOWN, 1 ; person

	def_warps_to SAFARI_ZONE_SECRET_HOUSE
