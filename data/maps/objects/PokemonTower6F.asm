PokemonTower6F_Object:
	db $1 ; border block

	def_warp_events
	warp_event 18,  9, 1, POKEMON_TOWER_5F
	warp_event  9, 16, 0, POKEMON_TOWER_7F

	def_bg_events

	def_object_events
	object_event SPRITE_CHANNELER, 12, 10, STAY, RIGHT, 1, OPP_CHANNELER, 19
	object_event SPRITE_CHANNELER, 9, 5, STAY, DOWN, 2, OPP_CHANNELER, 20
	object_event SPRITE_CHANNELER, 16, 5, STAY, LEFT, 3, OPP_CHANNELER, 21
	object_event SPRITE_POKE_BALL, 6, 8, STAY, NONE, 4, RARE_CANDY
	object_event SPRITE_POKE_BALL, 14, 14, STAY, NONE, 5, X_ACCURACY

	def_warps_to POKEMON_TOWER_6F
