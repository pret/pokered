PowerPlant_Object:
	db $2e ; border block

	def_warp_events
	warp_event  4, 35, 3, LAST_MAP
	warp_event  5, 35, 3, LAST_MAP
	warp_event  0, 11, 3, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_POKE_BALL, 9, 20, STAY, NONE, 1, VOLTORB, 40
	object_event SPRITE_POKE_BALL, 32, 18, STAY, NONE, 2, VOLTORB, 40
	object_event SPRITE_POKE_BALL, 21, 25, STAY, NONE, 3, VOLTORB, 40
	object_event SPRITE_POKE_BALL, 25, 18, STAY, NONE, 4, ELECTRODE, 43
	object_event SPRITE_POKE_BALL, 23, 34, STAY, NONE, 5, VOLTORB, 40
	object_event SPRITE_POKE_BALL, 26, 28, STAY, NONE, 6, VOLTORB, 40
	object_event SPRITE_POKE_BALL, 21, 14, STAY, NONE, 7, ELECTRODE, 43
	object_event SPRITE_POKE_BALL, 37, 32, STAY, NONE, 8, VOLTORB, 40
	object_event SPRITE_BIRD, 4, 9, STAY, UP, 9, ZAPDOS, 50
	object_event SPRITE_POKE_BALL, 7, 25, STAY, NONE, 10, CARBOS
	object_event SPRITE_POKE_BALL, 28, 3, STAY, NONE, 11, HP_UP
	object_event SPRITE_POKE_BALL, 34, 3, STAY, NONE, 12, RARE_CANDY
	object_event SPRITE_POKE_BALL, 26, 32, STAY, NONE, 13, TM_THUNDER
	object_event SPRITE_POKE_BALL, 20, 32, STAY, NONE, 14, TM_REFLECT

	def_warps_to POWER_PLANT
