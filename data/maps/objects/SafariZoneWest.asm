SafariZoneWest_Object:
	db $0 ; border block

	def_warp_events
	warp_event 20,  0, SAFARI_ZONE_NORTH, 1
	warp_event 21,  0, SAFARI_ZONE_NORTH, 2
	warp_event 26,  0, SAFARI_ZONE_NORTH, 3
	warp_event 27,  0, SAFARI_ZONE_NORTH, 4
	warp_event 29, 22, SAFARI_ZONE_CENTER, 3
	warp_event 29, 23, SAFARI_ZONE_CENTER, 4
	warp_event  3,  3, SAFARI_ZONE_SECRET_HOUSE, 1
	warp_event 11, 11, SAFARI_ZONE_WEST_REST_HOUSE, 1

	def_bg_events
	bg_event 12, 12, 5 ; SafariZoneWestText5
	bg_event 17,  3, 6 ; SafariZoneWestText6
	bg_event 26,  4, 7 ; SafariZoneWestText7
	bg_event 24, 22, 8 ; SafariZoneWestText8

	def_object_events
	object_event  8, 20, SPRITE_POKE_BALL, STAY, NONE, 1, MAX_POTION
	object_event  9,  7, SPRITE_POKE_BALL, STAY, NONE, 2, TM_DOUBLE_TEAM
	object_event 18, 18, SPRITE_POKE_BALL, STAY, NONE, 3, MAX_REVIVE
	object_event 19,  7, SPRITE_POKE_BALL, STAY, NONE, 4, GOLD_TEETH

	def_warps_to SAFARI_ZONE_WEST
