SilphGauntlet4F_Object:
	db $1 ; border block

	def_warp_events
	warp_event  1,  5, SILPH_GAUNTLET_3F, 2
	warp_event  3,  16, SILPH_GAUNTLET_5F, 1

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SCIENTIST, STAY, LEFT, 1, OPP_SCIENTIST, 1
	object_event 14,  2, SPRITE_GAMBLER, STAY, RIGHT, 2, OPP_GAMBLER, 6
	object_event 18, 11, SPRITE_ROCKET, STAY, LEFT, 3, OPP_ROCKET, 22
	object_event 12, 10, SPRITE_YOUNGSTER, STAY, RIGHT, 4, OPP_PSYCHIC_TR, 5
	object_event  7,  5, SPRITE_SUPER_NERD, STAY, UP, 5, OPP_BURGLAR, 1
	object_event  4, 14, SPRITE_CHANNELER, STAY, DOWN, 6, OPP_CHANNELER, 7

	def_warps_to SILPH_GAUNTLET_4F
