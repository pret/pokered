SafariZoneEast_Object:
	db $0 ; border block

	def_warp_events
	warp_event  0,  4, SAFARI_ZONE_NORTH, 7
	warp_event  0,  5, SAFARI_ZONE_NORTH, 8
	warp_event  0, 22, SAFARI_ZONE_CENTER, 7
	warp_event  0, 23, SAFARI_ZONE_CENTER, 7
	warp_event 25,  9, SAFARI_ZONE_EAST_REST_HOUSE, 1

	def_bg_events
	bg_event 26, 10, 10 ; SafariZoneEastText5
	bg_event  6,  4, 11 ; SafariZoneEastText6
	bg_event  5, 23, 12 ; SafariZoneEastText7

	def_object_events
	object_event 1, 1, SPRITE_COOLTRAINER_F, STAY, RIGHT, 1, OPP_RANGER_F, 1
	object_event 26, 18, SPRITE_YOUNGSTER, STAY, NONE, 2, OPP_PSYCHIC_TR, 5
	object_event 5, 12, SPRITE_ROCKER, STAY, NONE, 3, OPP_ROCKER, 4
	object_event 14, 4, SPRITE_COOLTRAINER_M, STAY, DOWN, 4, OPP_COOLTRAINER_M, 6
	object_event 25, 7, SPRITE_SAFARI_ZONE_WORKER, STAY, DOWN, 5, OPP_ENGINEER, 4
	object_event 21, 10, SPRITE_POKE_BALL, STAY, NONE, 6, FULL_RESTORE
	object_event  3,  7, SPRITE_POKE_BALL, STAY, NONE, 7, MAX_POTION
	object_event 20, 13, SPRITE_POKE_BALL, STAY, NONE, 8, CARBOS
	object_event 15, 12, SPRITE_POKE_BALL, STAY, NONE, 9, TM_DOUBLE_EDGE

	def_warps_to SAFARI_ZONE_EAST
