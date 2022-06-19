SafariZoneNorth_Object:
	db $0 ; border block

	def_warp_events
	warp_event  2, 35, SAFARI_ZONE_WEST, 1
	warp_event  3, 35, SAFARI_ZONE_WEST, 2
	warp_event  8, 35, SAFARI_ZONE_WEST, 3
	warp_event  9, 35, SAFARI_ZONE_WEST, 4
	warp_event 20, 35, SAFARI_ZONE_CENTER, 5
	warp_event 21, 35, SAFARI_ZONE_CENTER, 6
	warp_event 39, 30, SAFARI_ZONE_EAST, 1
	warp_event 39, 31, SAFARI_ZONE_EAST, 2
	warp_event 35,  3, SAFARI_ZONE_NORTH_REST_HOUSE, 1

	def_bg_events
	bg_event 36,  4, 9 ; SafariZoneNorthText3
	bg_event  4, 25, 10 ; SafariZoneNorthText4
	bg_event 13, 31, 11 ; SafariZoneNorthText5
	bg_event 19, 33, 12 ; SafariZoneNorthText6
	bg_event 26, 28, 13 ; SafariZoneNorthText7

	def_object_events
	object_event 20, 15, SPRITE_BRUNETTE_GIRL, STAY, NONE, 1, OPP_RANGER_F, 2
	object_event 18, 29, SPRITE_ROCKER, STAY, RIGHT, 2, OPP_JUGGLER, 9
	object_event 32, 20, SPRITE_YOUNGSTER, STAY, NONE, 3, OPP_COOLTRAINER_M, 8
	object_event 8, 14, SPRITE_GAMEBOY_KID, STAY, DOWN, 4, OPP_SUPER_NERD, 6
	object_event 37, 7, SPRITE_SAFARI_ZONE_WORKER, STAY, LEFT, 5, OPP_ENGINEER, 5
	object_event 5, 6, SPRITE_SUPER_NERD, STAY, NONE, 6, OPP_POKEMANIAC, 9
	object_event 25,  1, SPRITE_POKE_BALL, STAY, NONE, 7, PROTEIN
	object_event 19,  7, SPRITE_POKE_BALL, STAY, NONE, 8, TM_SLAM


	def_warps_to SAFARI_ZONE_NORTH
