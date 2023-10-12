	object_const_def
	const_export UNDERGROUNDPATHROUTE5_LITTLE_GIRL

UndergroundPathRoute5_Object:
	db $a ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 4
	warp_event  4,  7, LAST_MAP, 4
	warp_event  4,  4, UNDERGROUND_PATH_NORTH_SOUTH, 1

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_LITTLE_GIRL, STAY, NONE, TEXT_UNDERGROUNDPATHROUTE5_LITTLE_GIRL

	def_warps_to UNDERGROUND_PATH_ROUTE_5
