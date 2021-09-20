PokemonMansion2F_Object:
	db $1 ; border block

	def_warp_events
	warp_event  5, 10, 4, POKEMON_MANSION_1F
	warp_event  7, 10, 0, POKEMON_MANSION_3F
	warp_event 25, 14, 2, POKEMON_MANSION_3F
	warp_event  6,  1, 1, POKEMON_MANSION_3F

	def_bg_events

	def_object_events
	object_event SPRITE_SUPER_NERD, 3, 17, WALK, LEFT_RIGHT, 1, OPP_BURGLAR, 7
	object_event SPRITE_POKE_BALL, 28, 7, STAY, NONE, 2, CALCIUM
	object_event SPRITE_POKEDEX, 18, 2, STAY, NONE, 3 ; person
	object_event SPRITE_POKEDEX, 3, 22, STAY, NONE, 4 ; person

	def_warps_to POKEMON_MANSION_2F
