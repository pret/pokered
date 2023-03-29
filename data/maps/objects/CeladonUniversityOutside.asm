CeladonUniversityOutside_Object:
	db $f ; border block

	def_warp_events
	warp_event 20, 13, CELADON_UNIVERSITY_INSIDE, 1
	warp_event 15, 25, CELADON_UNIVERSITY_POKECENTER, 1

	def_bg_events

	def_object_events
	object_event 19, 30, SPRITE_COOLTRAINER_F, WALK, RIGHT, 1 ; trainer
	object_event 22, 26, SPRITE_SUPER_NERD, WALK, LEFT, 2 ; trainer
	object_event  9,  6, SPRITE_GAMBLER, WALK, DOWN, 3 ; trainer
	object_event 25, 20, SPRITE_SUPER_NERD, WALK, DOWN, 4 ; trainer
	object_event  4, 27, SPRITE_ROCKER, WALK, LEFT, 5
	object_event 33, 16, SPRITE_BEAUTY, WALK, DOWN, 6
	object_event  7, 22, SPRITE_SEEL, WALK, RIGHT, 7
	object_event 34, 25, SPRITE_SEEL, WALK, LEFT, 7

	def_warps_to CELADON_UNIVERSITY_OUTSIDE