CeladonUniversityOutside_Object:
	db $f ; border block

	def_warp_events
	warp_event 20, 13, CELADON_UNIVERSITY_INSIDE, 1

	def_bg_events

	def_object_events
	object_event 19, 30, SPRITE_COOLTRAINER_F, STAY, RIGHT, 1, OPP_JR_TRAINER_F, 3
	object_event 22, 26, SPRITE_SUPER_NERD, STAY, LEFT, 2, OPP_SUPER_NERD, 6
	object_event  9,  6, SPRITE_BALDING_GUY, STAY, DOWN, 3, OPP_ENGINEER, 1

	def_warps_to CELADON_UNIVERSITY_OUTSIDE