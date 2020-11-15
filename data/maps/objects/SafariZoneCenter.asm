SafariZoneCenter_Object:
	db $0 ; border block

	def_warps
	warp 14, 25, 2, SAFARI_ZONE_GATE
	warp 15, 25, 3, SAFARI_ZONE_GATE
	warp  0, 10, 4, SAFARI_ZONE_WEST
	warp  0, 11, 5, SAFARI_ZONE_WEST
	warp 14,  0, 4, SAFARI_ZONE_NORTH
	warp 15,  0, 5, SAFARI_ZONE_NORTH
	warp 29, 10, 2, SAFARI_ZONE_EAST
	warp 29, 11, 3, SAFARI_ZONE_EAST
	warp 17, 19, 0, SAFARI_ZONE_CENTER_REST_HOUSE

	def_signs
	sign 18, 20, 2 ; SafariZoneCenterText2
	sign 14, 22, 3 ; SafariZoneCenterText3

	def_objects
	object SPRITE_POKE_BALL, 14, 10, STAY, NONE, 1, NUGGET

	def_warps_to SAFARI_ZONE_CENTER
