UndergroundPathRoute6_Object:
	db $a ; border block

	def_warp_events
	warp_event  3,  7, 3, LAST_MAP
	warp_event  4,  7, 3, LAST_MAP
	warp_event  4,  4, 1, UNDERGROUND_PATH_NORTH_SOUTH

	def_bg_events

	def_objects
	object SPRITE_GIRL, 2, 3, STAY, NONE, 1 ; person

	def_warps_to UNDERGROUND_PATH_ROUTE_6
