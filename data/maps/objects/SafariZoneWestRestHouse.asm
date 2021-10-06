SafariZoneWestRestHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_WEST, 8
	warp_event  3,  7, SAFARI_ZONE_WEST, 8

	def_bg_events

	def_object_events
	object_event  4,  4, SPRITE_SCIENTIST, WALK, ANY_DIR, 1 ; person
	object_event  0,  2, SPRITE_COOLTRAINER_M, STAY, RIGHT, 2 ; person
	object_event  6,  2, SPRITE_ERIKA, STAY, DOWN, 3 ; person

	def_warps_to SAFARI_ZONE_WEST_REST_HOUSE
