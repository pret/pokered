PokemonMansion2F_Object:
	db $1 ; border block

	def_warp_events
	warp_event  5, 10, POKEMON_MANSION_1F, 5
	warp_event  7, 10, POKEMON_MANSION_3F, 1
	warp_event 25, 14, POKEMON_MANSION_3F, 3
	warp_event  6,  1, POKEMON_MANSION_3F, 2

	def_bg_events

	def_object_events
	object_event  3, 17, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, 1, OPP_BURGLAR, 7
	object_event  3, 4, SPRITE_COOLTRAINER_M, WALK, LEFT_RIGHT, 2, OPP_COOLTRAINER_M, 4
	object_event 12, 18, SPRITE_COOLTRAINER_F, WALK, UP_DOWN, 3, OPP_COOLTRAINER_F, 4
	object_event 17, 10, SPRITE_SCIENTIST, STAY, RIGHT, 4, OPP_SCIENTIST, 1
	object_event 27, 11, SPRITE_COOLTRAINER_F, WALK, LEFT_RIGHT, 5, OPP_COOLTRAINER_F, 6
	object_event 28,  7, SPRITE_POKE_BALL, STAY, NONE, 6, CALCIUM
	object_event 18,  2, SPRITE_POKEDEX, STAY, NONE, 7 ; person
	object_event  3, 22, SPRITE_POKEDEX, STAY, NONE, 8 ; person

	def_warps_to POKEMON_MANSION_2F
