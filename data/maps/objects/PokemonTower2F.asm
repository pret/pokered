PokemonTower2F_Object:
	db $1 ; border block

	def_warp_events
	warp_event  3,  9, 0, POKEMON_TOWER_3F
	warp_event 18,  9, 2, POKEMON_TOWER_1F

	def_bg_events

	def_object_events
	object_event SPRITE_BLUE, 14, 5, STAY, NONE, 1 ; person
	object_event SPRITE_CHANNELER, 3, 7, STAY, RIGHT, 2 ; person

	def_warps_to POKEMON_TOWER_2F
