SaffronGym_Object:
	db $2e ; border block

	def_warp_events
	warp_event  8, 17, 2, LAST_MAP
	warp_event  9, 17, 2, LAST_MAP
	warp_event  1,  3, 22, SAFFRON_GYM
	warp_event  5,  3, 15, SAFFRON_GYM
	warp_event  1,  5, 18, SAFFRON_GYM
	warp_event  5,  5, 8, SAFFRON_GYM
	warp_event  1,  9, 27, SAFFRON_GYM
	warp_event  5,  9, 16, SAFFRON_GYM
	warp_event  1, 11, 5, SAFFRON_GYM
	warp_event  5, 11, 13, SAFFRON_GYM
	warp_event  1, 15, 23, SAFFRON_GYM
	warp_event  5, 15, 30, SAFFRON_GYM
	warp_event  1, 17, 17, SAFFRON_GYM
	warp_event  5, 17, 9, SAFFRON_GYM
	warp_event  9,  3, 26, SAFFRON_GYM
	warp_event 11,  3, 3, SAFFRON_GYM
	warp_event  9,  5, 7, SAFFRON_GYM
	warp_event 11,  5, 12, SAFFRON_GYM
	warp_event 11, 11, 4, SAFFRON_GYM
	warp_event 11, 15, 31, SAFFRON_GYM
	warp_event 15,  3, 24, SAFFRON_GYM
	warp_event 19,  3, 28, SAFFRON_GYM
	warp_event 15,  5, 2, SAFFRON_GYM
	warp_event 19,  5, 10, SAFFRON_GYM
	warp_event 15,  9, 20, SAFFRON_GYM
	warp_event 19,  9, 29, SAFFRON_GYM
	warp_event 15, 11, 14, SAFFRON_GYM
	warp_event 19, 11, 6, SAFFRON_GYM
	warp_event 15, 15, 21, SAFFRON_GYM
	warp_event 19, 15, 25, SAFFRON_GYM
	warp_event 15, 17, 11, SAFFRON_GYM
	warp_event 19, 17, 19, SAFFRON_GYM

	def_bg_events

	def_objects
	object SPRITE_GIRL, 9, 8, STAY, DOWN, 1, OPP_SABRINA, 1
	object SPRITE_CHANNELER, 10, 1, STAY, DOWN, 2, OPP_CHANNELER, 22
	object SPRITE_YOUNGSTER, 17, 1, STAY, DOWN, 3, OPP_PSYCHIC_TR, 1
	object SPRITE_CHANNELER, 3, 7, STAY, DOWN, 4, OPP_CHANNELER, 23
	object SPRITE_YOUNGSTER, 17, 7, STAY, DOWN, 5, OPP_PSYCHIC_TR, 2
	object SPRITE_CHANNELER, 3, 13, STAY, DOWN, 6, OPP_CHANNELER, 24
	object SPRITE_YOUNGSTER, 17, 13, STAY, DOWN, 7, OPP_PSYCHIC_TR, 3
	object SPRITE_YOUNGSTER, 3, 1, STAY, DOWN, 8, OPP_PSYCHIC_TR, 4
	object SPRITE_GYM_GUIDE, 10, 15, STAY, DOWN, 9 ; person

	def_warps_to SAFFRON_GYM
