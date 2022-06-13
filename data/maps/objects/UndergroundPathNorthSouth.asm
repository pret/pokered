UndergroundPathNorthSouth_Object:
	db $1 ; border block

	def_warp_events
	warp_event  5,  4, UNDERGROUND_PATH_ROUTE_5, 3
	warp_event  2, 41, UNDERGROUND_PATH_ROUTE_6, 3

	def_bg_events

	def_object_events
	object_event  5, 40, SPRITE_GENTLEMAN, WALK, UP, 1, OPP_GENTLEMAN, 4
	object_event  2, 19, SPRITE_LITTLE_BOY, STAY, DOWN, 2, OPP_COOL_KID, 2
	object_event  2, 20, SPRITE_LITTLE_BOY, STAY, UP, 3, OPP_COOL_KID, 3

	def_warps_to UNDERGROUND_PATH_NORTH_SOUTH
