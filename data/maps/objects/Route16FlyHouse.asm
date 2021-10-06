Route16FlyHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 9
	warp_event  3,  7, LAST_MAP, 9

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_BRUNETTE_GIRL, STAY, RIGHT, 1 ; person
	object_event  6,  4, SPRITE_BIRD, WALK, ANY_DIR, 2 ; person

	def_warps_to ROUTE_16_FLY_HOUSE
