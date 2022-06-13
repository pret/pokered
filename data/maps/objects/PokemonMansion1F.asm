PokemonMansion1F_Object:
	db $2e ; border block

	def_warp_events
	warp_event  4, 27, LAST_MAP, 1
	warp_event  5, 27, LAST_MAP, 1
	warp_event  6, 27, LAST_MAP, 1
	warp_event  7, 27, LAST_MAP, 1
	warp_event  5, 10, POKEMON_MANSION_2F, 1
	warp_event 21, 23, POKEMON_MANSION_B1F, 1
	warp_event 26, 27, LAST_MAP, 1
	warp_event 27, 27, LAST_MAP, 1

	def_bg_events

	def_object_events
	object_event 17, 17, SPRITE_SCIENTIST, STAY, LEFT, 1, OPP_SCIENTIST, 14
	object_event 1,  1, SPRITE_SUPER_NERD, STAY, RIGHT, 2, OPP_BURGLAR, 3
	object_event 2, 13, SPRITE_GUARD, STAY, RIGHT, 3, OPP_FIREFIGHTER, 7
	object_event 19, 9, SPRITE_GUARD, STAY, LEFT, 4, OPP_FIREFIGHTER, 8
	object_event 14,  3, SPRITE_POKE_BALL, STAY, NONE, 5, ESCAPE_ROPE
	object_event 18, 21, SPRITE_POKE_BALL, STAY, NONE, 6, CARBOS

	def_warps_to POKEMON_MANSION_1F
