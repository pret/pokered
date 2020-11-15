SafariZoneWest_Object:
	db $0 ; border block

	def_warps
	warp 20,  0, 0, SAFARI_ZONE_NORTH
	warp 21,  0, 1, SAFARI_ZONE_NORTH
	warp 26,  0, 2, SAFARI_ZONE_NORTH
	warp 27,  0, 3, SAFARI_ZONE_NORTH
	warp 29, 22, 2, SAFARI_ZONE_CENTER
	warp 29, 23, 3, SAFARI_ZONE_CENTER
	warp  3,  3, 0, SAFARI_ZONE_SECRET_HOUSE
	warp 11, 11, 0, SAFARI_ZONE_WEST_REST_HOUSE

	def_signs
	sign 12, 12, 5 ; SafariZoneWestText5
	sign 17,  3, 6 ; SafariZoneWestText6
	sign 26,  4, 7 ; SafariZoneWestText7
	sign 24, 22, 8 ; SafariZoneWestText8

	def_objects
	object SPRITE_POKE_BALL, 8, 20, STAY, NONE, 1, MAX_POTION
	object SPRITE_POKE_BALL, 9, 7, STAY, NONE, 2, TM_DOUBLE_TEAM
	object SPRITE_POKE_BALL, 18, 18, STAY, NONE, 3, MAX_REVIVE
	object SPRITE_POKE_BALL, 19, 7, STAY, NONE, 4, GOLD_TEETH

	def_warps_to SAFARI_ZONE_WEST
