	object_const_def
	const_export UNDERGROUNDPATHROUTE7_MIDDLE_AGED_MAN

UndergroundPathRoute7_Object:
	db $a ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 5
	warp_event  4,  7, LAST_MAP, 5
	warp_event  4,  4, UNDERGROUND_PATH_WEST_EAST, 1

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_MIDDLE_AGED_MAN, STAY, NONE, TEXT_UNDERGROUNDPATHROUTE7_MIDDLE_AGED_MAN

	def_warps_to UNDERGROUND_PATH_ROUTE_7
