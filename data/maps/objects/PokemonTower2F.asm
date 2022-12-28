PokemonTower2F_Object:
	db $1 ; border block

	def_warp_events
	warp_event  3,  9, POKEMON_TOWER_3F, 1
	warp_event 18,  9, POKEMON_TOWER_1F, 3

	def_bg_events

	def_object_events
	object_event 14,  5, SPRITE_BLUE, STAY, NONE, 1 ; person
	object_event  3,  7, SPRITE_CHANNELER, STAY, RIGHT, 2 ; person

	def_warps_to POKEMON_TOWER_2F
