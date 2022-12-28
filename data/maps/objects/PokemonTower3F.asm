PokemonTower3F_Object:
	db $1 ; border block

	def_warp_events
	warp_event  3,  9, POKEMON_TOWER_2F, 1
	warp_event 18,  9, POKEMON_TOWER_4F, 2

	def_bg_events

	def_object_events
	object_event 12,  3, SPRITE_CHANNELER, STAY, LEFT, 1, OPP_CHANNELER, 5
	object_event  9,  8, SPRITE_CHANNELER, STAY, DOWN, 2, OPP_CHANNELER, 6
	object_event 10, 13, SPRITE_CHANNELER, STAY, DOWN, 3, OPP_CHANNELER, 8
	object_event 12,  1, SPRITE_POKE_BALL, STAY, NONE, 4, ESCAPE_ROPE

	def_warps_to POKEMON_TOWER_3F
