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
	bg_event 12, 12, 12 ; SafariZoneWestText5
	bg_event 17,  3, 13 ; SafariZoneWestText6
	bg_event 26,  4, 14 ; SafariZoneWestText7
	bg_event 24, 22, 15 ; SafariZoneWestText8

	def_object_events
	object_event 15, 24, SPRITE_BALDING_GUY, STAY, NONE, 1, OPP_RANGER, 2
	object_event 12, 7, SPRITE_COOK, STAY, NONE, 2, OPP_RANGER, 3
	object_event 21, 10, SPRITE_SUPER_NERD, STAY, NONE, 3, OPP_BURGLAR, 1
	object_event 22, 20, SPRITE_SUPER_NERD, STAY, NONE, 4, OPP_POKEMANIAC, 10
	object_event 5, 7, SPRITE_ROCKER, STAY, LEFT, 5, OPP_ROCKER, 5
	object_event 5, 6, SPRITE_ROCKER, STAY, LEFT, 6, OPP_JUGGLER, 10
	object_event 2, 5, SPRITE_YOUNGSTER, STAY, RIGHT, 7, OPP_PSYCHIC_TR, 6
	object_event  8, 20, SPRITE_POKE_BALL, STAY, NONE, 8, MAX_POTION
	object_event  9,  7, SPRITE_POKE_BALL, STAY, NONE, 9, TM_SWORDS_DANCE
	object_event 18, 18, SPRITE_POKE_BALL, STAY, NONE, 10, MAX_REVIVE
	object_event 19,  7, SPRITE_POKE_BALL, STAY, NONE, 11, GOLD_TEETH

	def_warps_to SAFARI_ZONE_WEST
