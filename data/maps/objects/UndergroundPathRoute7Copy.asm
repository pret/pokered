UndergroundPathRoute7Copy_Object:
	db $a ; border block

	def_warp_events
	warp_event  3,  7, 5, LAST_MAP
	warp_event  4,  7, 5, LAST_MAP
	warp_event  4,  4, 0, UNDERGROUND_PATH_WEST_EAST

	def_bg_events

	def_objects
	object SPRITE_GIRL, 3, 2, STAY, NONE, 1 ; person
	object SPRITE_MIDDLE_AGED_MAN, 2, 4, STAY, NONE, 2 ; person

	def_warps_to UNDERGROUND_PATH_ROUTE_7_COPY
