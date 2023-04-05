Route10_Object:
	db $2c ; border block

	def_warp_events
	warp_event 11, 27, ROCK_TUNNEL_POKECENTER, 1
	warp_event  8, 25, ROCK_TUNNEL_1F, 1
	warp_event  8, 61, ROCK_TUNNEL_1F, 3
	warp_event  6, 47, POWER_PLANT, 1
	warp_event  6,  3, UNDERWATER_TUNNEL, 2

	def_bg_events
	bg_event  7, 27, 7 ; Route10Text7
	bg_event 12, 27, 8 ; PokeCenterSignText
	bg_event  9, 63, 9 ; Route10Text9
	bg_event  5, 49, 10 ; Route10Text10

	def_object_events
	object_event 10, 52, SPRITE_SUPER_NERD, STAY, LEFT, 1, OPP_POKEMANIAC, 1
	object_event  3, 65, SPRITE_HIKER, STAY, UP, 2, OPP_HIKER, 7
	object_event 14, 72, SPRITE_SUPER_NERD, STAY, LEFT, 3, OPP_POKEMANIAC, 2
	object_event  7, 33, SPRITE_COOLTRAINER_F, STAY, LEFT, 4, OPP_JR_TRAINER_F, 7
	object_event  3, 69, SPRITE_HIKER, STAY, DOWN, 5, OPP_HIKER, 8
	object_event  7, 62, SPRITE_COOLTRAINER_F, STAY, DOWN, 6, OPP_JR_TRAINER_F, 8

	def_warps_to ROUTE_10
