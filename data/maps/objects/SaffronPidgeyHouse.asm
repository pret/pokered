SaffronPidgeyHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 3, LAST_MAP
	warp_event  3,  7, 3, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_BRUNETTE_GIRL, 2, 3, STAY, RIGHT, 1 ; person
	object_event SPRITE_BIRD, 0, 4, WALK, UP_DOWN, 2 ; person
	object_event SPRITE_YOUNGSTER, 4, 1, STAY, DOWN, 3 ; person
	object_event SPRITE_PAPER, 3, 3, STAY, NONE, 4 ; person

	def_warps_to SAFFRON_PIDGEY_HOUSE
