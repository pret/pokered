SilphCo5F_Object:
	db $2e ; border block

	def_warp_events
	warp_event 24,  0, 1, SILPH_CO_6F
	warp_event 26,  0, 1, SILPH_CO_4F
	warp_event 20,  0, 0, SILPH_CO_ELEVATOR
	warp_event 27,  3, 5, SILPH_CO_7F
	warp_event  9, 15, 4, SILPH_CO_9F
	warp_event 11,  5, 4, SILPH_CO_3F
	warp_event  3, 15, 5, SILPH_CO_3F

	def_bg_events

	def_object_events
	object_event SPRITE_SILPH_WORKER, 13, 9, STAY, NONE, 1 ; person
	object_event SPRITE_ROCKET, 8, 16, STAY, RIGHT, 2, OPP_ROCKET, 28
	object_event SPRITE_SCIENTIST, 8, 3, STAY, RIGHT, 3, OPP_SCIENTIST, 6
	object_event SPRITE_ROCKER, 18, 10, STAY, UP, 4, OPP_JUGGLER, 1
	object_event SPRITE_ROCKET, 28, 4, STAY, UP, 5, OPP_ROCKET, 29
	object_event SPRITE_POKE_BALL, 2, 13, STAY, NONE, 6, TM_TAKE_DOWN
	object_event SPRITE_POKE_BALL, 4, 6, STAY, NONE, 7, PROTEIN
	object_event SPRITE_POKE_BALL, 21, 16, STAY, NONE, 8, CARD_KEY
	object_event SPRITE_CLIPBOARD, 22, 12, STAY, NONE, 9 ; person
	object_event SPRITE_CLIPBOARD, 25, 10, STAY, NONE, 10 ; person
	object_event SPRITE_CLIPBOARD, 24, 6, STAY, NONE, 11 ; person

	def_warps_to SILPH_CO_5F
