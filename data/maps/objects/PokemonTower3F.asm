PokemonTower3F_Object:
	db $1 ; border block

	def_warp_events
	warp_event  3,  9, 0, POKEMON_TOWER_2F
	warp_event 18,  9, 1, POKEMON_TOWER_4F

	def_bg_events

	def_object_events
	object_event SPRITE_CHANNELER, 12, 3, STAY, LEFT, 1, OPP_CHANNELER, 5
	object_event SPRITE_CHANNELER, 9, 8, STAY, DOWN, 2, OPP_CHANNELER, 6
	object_event SPRITE_CHANNELER, 10, 13, STAY, DOWN, 3, OPP_CHANNELER, 8
	object_event SPRITE_POKE_BALL, 12, 1, STAY, NONE, 4, ESCAPE_ROPE

	def_warps_to POKEMON_TOWER_3F
