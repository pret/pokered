CinnabarGym_Object:
	db $2e ; border block

	def_warp_events
	warp_event 16, 17, LAST_MAP, 2
	warp_event 17, 17, LAST_MAP, 2

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_MIDDLE_AGED_MAN, STAY, DOWN, 1, OPP_BLAINE, 1
	object_event 17,  2, SPRITE_SUPER_NERD, STAY, DOWN, 2, OPP_SUPER_NERD, 9
	object_event 17,  8, SPRITE_SUPER_NERD, STAY, DOWN, 3, OPP_BURGLAR, 4
	object_event 11,  4, SPRITE_SUPER_NERD, STAY, DOWN, 4, OPP_SUPER_NERD, 10
	object_event 11,  8, SPRITE_SUPER_NERD, STAY, DOWN, 5, OPP_BURGLAR, 5
	object_event 11, 14, SPRITE_SUPER_NERD, STAY, DOWN, 6, OPP_SUPER_NERD, 11
	object_event  3, 14, SPRITE_SUPER_NERD, STAY, DOWN, 7, OPP_BURGLAR, 6
	object_event  3,  8, SPRITE_SUPER_NERD, STAY, DOWN, 8, OPP_SUPER_NERD, 12
	object_event 16, 13, SPRITE_GYM_GUIDE, STAY, DOWN, 9 ; person

	def_warps_to CINNABAR_GYM
