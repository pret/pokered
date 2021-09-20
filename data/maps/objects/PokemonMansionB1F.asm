PokemonMansionB1F_Object:
	db $1 ; border block

	def_warp_events
	warp_event 23, 22, 5, POKEMON_MANSION_1F

	def_bg_events

	def_object_events
	object_event SPRITE_SUPER_NERD, 16, 23, STAY, NONE, 1, OPP_BURGLAR, 9
	object_event SPRITE_SCIENTIST, 27, 11, STAY, DOWN, 2, OPP_SCIENTIST, 13
	object_event SPRITE_POKE_BALL, 10, 2, STAY, NONE, 3, RARE_CANDY
	object_event SPRITE_POKE_BALL, 1, 22, STAY, NONE, 4, FULL_RESTORE
	object_event SPRITE_POKE_BALL, 19, 25, STAY, NONE, 5, TM_BLIZZARD
	object_event SPRITE_POKE_BALL, 5, 4, STAY, NONE, 6, TM_SOLARBEAM
	object_event SPRITE_POKEDEX, 16, 20, STAY, NONE, 7 ; person
	object_event SPRITE_POKE_BALL, 5, 13, STAY, NONE, 8, SECRET_KEY

	def_warps_to POKEMON_MANSION_B1F
