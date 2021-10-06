UndergroundPathRoute8_Object:
	db $a ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 5
	warp_event  4,  7, LAST_MAP, 5
	warp_event  4,  4, UNDERGROUND_PATH_WEST_EAST, 2

	def_bg_events

	def_object_events
	object_event  3,  4, SPRITE_GIRL, STAY, NONE, 1 ; person

	def_warps_to UNDERGROUND_PATH_ROUTE_8
