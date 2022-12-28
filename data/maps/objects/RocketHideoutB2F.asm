RocketHideoutB2F_Object:
	db $2e ; border block

	def_warp_events
	warp_event 27,  8, ROCKET_HIDEOUT_B1F, 1
	warp_event 21,  8, ROCKET_HIDEOUT_B3F, 1
	warp_event 24, 19, ROCKET_HIDEOUT_ELEVATOR, 1
	warp_event 21, 22, ROCKET_HIDEOUT_B1F, 4
	warp_event 25, 19, ROCKET_HIDEOUT_ELEVATOR, 2

	def_bg_events

	def_object_events
	object_event 20, 12, SPRITE_ROCKET, STAY, DOWN, 1, OPP_ROCKET, 13
	object_event  1, 11, SPRITE_POKE_BALL, STAY, NONE, 2, MOON_STONE
	object_event 16,  8, SPRITE_POKE_BALL, STAY, NONE, 3, NUGGET
	object_event  6, 12, SPRITE_POKE_BALL, STAY, NONE, 4, TM_HORN_DRILL
	object_event  3, 21, SPRITE_POKE_BALL, STAY, NONE, 5, SUPER_POTION

	def_warps_to ROCKET_HIDEOUT_B2F
