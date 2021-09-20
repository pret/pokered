CeladonDiner_Object:
	db $f ; border block

	def_warp_events
	warp_event  3,  7, 10, LAST_MAP
	warp_event  4,  7, 10, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_COOK, 8, 5, WALK, LEFT_RIGHT, 1 ; person
	object_event SPRITE_MIDDLE_AGED_WOMAN, 7, 2, STAY, NONE, 2 ; person
	object_event SPRITE_MIDDLE_AGED_MAN, 1, 4, STAY, DOWN, 3 ; person
	object_event SPRITE_FISHER, 5, 3, STAY, RIGHT, 4 ; person
	object_event SPRITE_GYM_GUIDE, 0, 1, STAY, DOWN, 5 ; person

	def_warps_to CELADON_DINER
