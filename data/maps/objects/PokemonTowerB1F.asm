PokemonTowerB1F_Object:
	db $1 ; border block

	def_warp_events
	warp_event 3,  9, POKEMON_TOWER_1F, 4

	def_bg_events

	def_object_events
	object_event 8, 10, SPRITE_DARK_CHANNELER, STAY, DOWN, 1 ; person

	def_warps_to POKEMON_TOWER_B1F
