UndergroundPathRoute8_Object:
	db $a ; border block

	def_warp_events
	warp_event  3,  7, 4, LAST_MAP
	warp_event  4,  7, 4, LAST_MAP
	warp_event  4,  4, 1, UNDERGROUND_PATH_WEST_EAST

	def_bg_events

	def_object_events
	object_event SPRITE_GIRL, 3, 4, STAY, NONE, 1 ; person

	def_warps_to UNDERGROUND_PATH_ROUTE_8
