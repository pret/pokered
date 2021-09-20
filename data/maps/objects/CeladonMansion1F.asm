CeladonMansion1F_Object:
	db $f ; border block

	def_warp_events
	warp_event  4, 11, 2, LAST_MAP
	warp_event  5, 11, 2, LAST_MAP
	warp_event  4,  0, 4, LAST_MAP
	warp_event  7,  1, 1, CELADON_MANSION_2F
	warp_event  2,  1, 2, CELADON_MANSION_2F

	def_bg_events
	bg_event  4,  9, 5 ; CeladonMansion1Text5

	def_object_events
	object_event SPRITE_MONSTER, 0, 5, STAY, RIGHT, 1 ; person
	object_event SPRITE_GRANNY, 1, 5, STAY, DOWN, 2 ; person
	object_event SPRITE_FAIRY, 1, 8, WALK, LEFT_RIGHT, 3 ; person
	object_event SPRITE_MONSTER, 4, 4, WALK, UP_DOWN, 4 ; person

	def_warps_to CELADON_MANSION_1F
