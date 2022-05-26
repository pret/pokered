SafariZoneCenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event 14, 25, SAFARI_ZONE_GATE, 3
	warp_event 15, 25, SAFARI_ZONE_GATE, 4
	warp_event  0, 10, SAFARI_ZONE_WEST, 5
	warp_event  0, 11, SAFARI_ZONE_WEST, 6
	warp_event 14,  0, SAFARI_ZONE_NORTH, 5
	warp_event 15,  0, SAFARI_ZONE_NORTH, 6
	warp_event 29, 10, SAFARI_ZONE_EAST, 3
	warp_event 29, 11, SAFARI_ZONE_EAST, 4
	warp_event 17, 19, SAFARI_ZONE_CENTER_REST_HOUSE, 1

	def_bg_events
	bg_event 18, 20, 7 ; SafariZoneCenterText2
	bg_event 14, 22, 8 ; SafariZoneCenterText3

	def_object_events
	object_event 15, 10, SPRITE_SILPH_WORKER, STAY, NONE, 1, OPP_RANGER, 1
	object_event 5, 20, SPRITE_ROCKER, STAY, NONE, 2, OPP_ROCKER, 3
	object_event 20, 19, SPRITE_SAFARI_ZONE_WORKER, STAY, DOWN, 3, OPP_ENGINEER, 1
	object_event 26, 3, SPRITE_ROCKER, STAY, NONE, 4, OPP_JUGGLER, 6
	object_event 8, 3, SPRITE_SUPER_NERD, STAY, DOWN, 5, OPP_POKEMANIAC, 8
	object_event 14, 10, SPRITE_POKE_BALL, STAY, NONE, 6, NUGGET

	def_warps_to SAFARI_ZONE_CENTER
