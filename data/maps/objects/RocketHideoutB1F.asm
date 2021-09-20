RocketHideoutB1F_Object:
	db $2e ; border block

	def_warp_events
	warp_event 23,  2, 0, ROCKET_HIDEOUT_B2F
	warp_event 21,  2, 2, GAME_CORNER
	warp_event 24, 19, 0, ROCKET_HIDEOUT_ELEVATOR
	warp_event 21, 24, 3, ROCKET_HIDEOUT_B2F
	warp_event 25, 19, 1, ROCKET_HIDEOUT_ELEVATOR

	def_bg_events

	def_object_events
	object_event SPRITE_ROCKET, 26, 8, STAY, LEFT, 1, OPP_ROCKET, 8
	object_event SPRITE_ROCKET, 12, 6, STAY, RIGHT, 2, OPP_ROCKET, 9
	object_event SPRITE_ROCKET, 18, 17, STAY, DOWN, 3, OPP_ROCKET, 10
	object_event SPRITE_ROCKET, 15, 25, STAY, RIGHT, 4, OPP_ROCKET, 11
	object_event SPRITE_ROCKET, 28, 18, STAY, LEFT, 5, OPP_ROCKET, 12
	object_event SPRITE_POKE_BALL, 11, 14, STAY, NONE, 6, ESCAPE_ROPE
	object_event SPRITE_POKE_BALL, 9, 17, STAY, NONE, 7, HYPER_POTION

	def_warps_to ROCKET_HIDEOUT_B1F
