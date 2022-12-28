SafariZoneNorthRestHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_NORTH, 9
	warp_event  3,  7, SAFARI_ZONE_NORTH, 9

	def_bg_events

	def_object_events
	object_event  6,  3, SPRITE_SCIENTIST, WALK, LEFT_RIGHT, 1 ; person
	object_event  3,  4, SPRITE_SAFARI_ZONE_WORKER, STAY, NONE, 2 ; person
	object_event  1,  5, SPRITE_GENTLEMAN, WALK, UP_DOWN, 3 ; person

	def_warps_to SAFARI_ZONE_NORTH_REST_HOUSE
