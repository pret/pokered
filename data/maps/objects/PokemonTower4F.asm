PokemonTower4F_Object:
	db $1 ; border block

	def_warp_events
	warp_event  3,  9, 0, POKEMON_TOWER_5F
	warp_event 18,  9, 1, POKEMON_TOWER_3F

	def_bg_events

	def_object_events
	object_event SPRITE_CHANNELER, 5, 10, STAY, RIGHT, 1, OPP_CHANNELER, 9
	object_event SPRITE_CHANNELER, 15, 7, STAY, DOWN, 2, OPP_CHANNELER, 10
	object_event SPRITE_CHANNELER, 14, 12, STAY, LEFT, 3, OPP_CHANNELER, 12
	object_event SPRITE_POKE_BALL, 12, 10, STAY, NONE, 4, ELIXER
	object_event SPRITE_POKE_BALL, 9, 10, STAY, NONE, 5, AWAKENING
	object_event SPRITE_POKE_BALL, 12, 16, STAY, NONE, 6, HP_UP

	def_warps_to POKEMON_TOWER_4F
