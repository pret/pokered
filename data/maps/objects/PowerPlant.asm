PowerPlant_Object:
	db $2e ; border block

	def_warp_events
	warp_event  4, 35, LAST_MAP, 4
	warp_event  5, 35, LAST_MAP, 4
	warp_event  0, 11, LAST_MAP, 4

	def_bg_events

	def_object_events
	object_event  9, 20, SPRITE_POKE_BALL, STAY, NONE, 1, VOLTORB, 40
	object_event 32, 18, SPRITE_POKE_BALL, STAY, NONE, 2, VOLTORB, 40
	object_event 21, 25, SPRITE_POKE_BALL, STAY, NONE, 3, VOLTORB, 40
	object_event 25, 18, SPRITE_POKE_BALL, STAY, NONE, 4, ELECTRODE, 43
	object_event 23, 34, SPRITE_POKE_BALL, STAY, NONE, 5, VOLTORB, 40
	object_event 26, 28, SPRITE_POKE_BALL, STAY, NONE, 6, VOLTORB, 40
	object_event 21, 14, SPRITE_POKE_BALL, STAY, NONE, 7, ELECTRODE, 43
	object_event 37, 32, SPRITE_POKE_BALL, STAY, NONE, 8, VOLTORB, 40
	object_event  4,  9, SPRITE_BIRD, STAY, UP, 9, ZAPDOS, 50
	object_event  7, 25, SPRITE_POKE_BALL, STAY, NONE, 10, CARBOS
	object_event 28,  3, SPRITE_POKE_BALL, STAY, NONE, 11, HP_UP
	object_event 34,  3, SPRITE_POKE_BALL, STAY, NONE, 12, RARE_CANDY
	object_event 26, 32, SPRITE_POKE_BALL, STAY, NONE, 13, TM_THUNDER
	object_event 20, 32, SPRITE_POKE_BALL, STAY, NONE, 14, TM_REFLECT

	def_warps_to POWER_PLANT
