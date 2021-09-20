SafariZoneCenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event 14, 25, 2, SAFARI_ZONE_GATE
	warp_event 15, 25, 3, SAFARI_ZONE_GATE
	warp_event  0, 10, 4, SAFARI_ZONE_WEST
	warp_event  0, 11, 5, SAFARI_ZONE_WEST
	warp_event 14,  0, 4, SAFARI_ZONE_NORTH
	warp_event 15,  0, 5, SAFARI_ZONE_NORTH
	warp_event 29, 10, 2, SAFARI_ZONE_EAST
	warp_event 29, 11, 3, SAFARI_ZONE_EAST
	warp_event 17, 19, 0, SAFARI_ZONE_CENTER_REST_HOUSE

	def_bg_events
	bg_event 18, 20, 2 ; SafariZoneCenterText2
	bg_event 14, 22, 3 ; SafariZoneCenterText3

	def_object_events
	object_event SPRITE_POKE_BALL, 14, 10, STAY, NONE, 1, NUGGET

	def_warps_to SAFARI_ZONE_CENTER
