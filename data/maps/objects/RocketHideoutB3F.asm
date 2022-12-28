RocketHideoutB3F_Object:
	db $2e ; border block

	def_warp_events
	warp_event 25,  6, ROCKET_HIDEOUT_B2F, 2
	warp_event 19, 18, ROCKET_HIDEOUT_B4F, 1

	def_bg_events

	def_object_events
	object_event 10, 22, SPRITE_ROCKET, STAY, RIGHT, 1, OPP_ROCKET, 14
	object_event 26, 12, SPRITE_ROCKET, STAY, UP, 2, OPP_ROCKET, 15
	object_event 26, 17, SPRITE_POKE_BALL, STAY, NONE, 3, TM_DOUBLE_EDGE
	object_event 20, 14, SPRITE_POKE_BALL, STAY, NONE, 4, RARE_CANDY

	def_warps_to ROCKET_HIDEOUT_B3F
