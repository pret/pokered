SafariZoneWestRestHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 7, SAFARI_ZONE_WEST
	warp_event  3,  7, 7, SAFARI_ZONE_WEST

	def_bg_events

	def_object_events
	object_event SPRITE_SCIENTIST, 4, 4, WALK, ANY_DIR, 1 ; person
	object_event SPRITE_COOLTRAINER_M, 0, 2, STAY, RIGHT, 2 ; person
	object_event SPRITE_ERIKA, 6, 2, STAY, DOWN, 3 ; person

	def_warps_to SAFARI_ZONE_WEST_REST_HOUSE
