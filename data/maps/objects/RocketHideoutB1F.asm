RocketHideoutB1F_Object:
	db $2e ; border block

	def_warp_events
	warp_event  5,  4, VIRIDIAN_GYM, 5

	def_bg_events

	def_object_events
	object_event  4, 22, SPRITE_PAPER, STAY, DOWN, 1
	object_event 17,  8, SPRITE_PAPER, STAY, RIGHT, 2
	object_event 17, 15, SPRITE_PAPER, STAY, DOWN, 3
	object_event  8, 16, SPRITE_PAPER, STAY, RIGHT, 4
	object_event 17,  9, SPRITE_POKE_BALL, STAY, NONE, 6, TM_EARTHQUAKE ; FIXME: doesn't work for some reason
	; object_event  5, 22, SPRITE_POKE_BALL, STAY, NONE, 7, PROTECTOR needs implementing

	def_warps_to ROCKET_HIDEOUT_B1F
