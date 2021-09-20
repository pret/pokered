SafariZoneCenterRestHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 8, SAFARI_ZONE_CENTER
	warp_event  3,  7, 8, SAFARI_ZONE_CENTER

	def_bg_events

	def_object_events
	object_event SPRITE_GIRL, 3, 2, STAY, DOWN, 1 ; person
	object_event SPRITE_SCIENTIST, 1, 4, WALK, UP_DOWN, 2 ; person

	def_warps_to SAFARI_ZONE_CENTER_REST_HOUSE
