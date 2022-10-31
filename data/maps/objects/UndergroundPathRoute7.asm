UndergroundPathRoute7_Object:
	db $a ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 5
	warp_event  4,  7, LAST_MAP, 5
	warp_event  6,  2, UNDERGROUND_PATH_WEST_EAST, 1
	warp_event  1,  3, UNDERGROUND_PATH_NORTH_SOUTH, 2

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_MIDDLE_AGED_MAN, STAY, NONE, 1 ; person

	def_warps_to UNDERGROUND_PATH_ROUTE_7
