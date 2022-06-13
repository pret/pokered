UndergroundPathWestEast_Object:
	db $1 ; border block

	def_warp_events
	warp_event  2,  5, UNDERGROUND_PATH_ROUTE_7, 3
	warp_event 47,  2, UNDERGROUND_PATH_ROUTE_8, 3

	def_bg_events

	def_object_events
	object_event  44, 4, SPRITE_GENTLEMAN, WALK, LEFT, 1, OPP_GENTLEMAN, 6
	object_event  42, 4, SPRITE_GENTLEMAN, WALK, LEFT, 2, OPP_GENTLEMAN, 7
	object_event  25, 1, SPRITE_LITTLE_BOY, WALK, LEFT_RIGHT, 3, OPP_COOL_KID, 4

	def_warps_to UNDERGROUND_PATH_WEST_EAST
