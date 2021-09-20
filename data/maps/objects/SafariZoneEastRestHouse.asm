SafariZoneEastRestHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 4, SAFARI_ZONE_EAST
	warp_event  3,  7, 4, SAFARI_ZONE_EAST

	def_bg_events

	def_object_events
	object_event SPRITE_SCIENTIST, 1, 3, WALK, UP_DOWN, 1 ; person
	object_event SPRITE_ROCKER, 4, 2, STAY, NONE, 2 ; person
	object_event SPRITE_SILPH_WORKER, 5, 2, STAY, NONE, 3 ; person

	def_warps_to SAFARI_ZONE_EAST_REST_HOUSE
