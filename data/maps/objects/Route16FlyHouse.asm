Route16FlyHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 8, LAST_MAP
	warp_event  3,  7, 8, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_BRUNETTE_GIRL, 2, 3, STAY, RIGHT, 1 ; person
	object_event SPRITE_BIRD, 6, 4, WALK, ANY_DIR, 2 ; person

	def_warps_to ROUTE_16_FLY_HOUSE
