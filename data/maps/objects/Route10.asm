Route10_Object:
	db $2c ; border block

	def_warp_events
	warp_event 11, 19, 0, ROCK_TUNNEL_POKECENTER
	warp_event  8, 17, 0, ROCK_TUNNEL_1F
	warp_event  8, 53, 2, ROCK_TUNNEL_1F
	warp_event  6, 39, 0, POWER_PLANT

	def_bg_events
	bg_event  7, 19, 7 ; Route10Text7
	bg_event 12, 19, 8 ; PokeCenterSignText
	bg_event  9, 55, 9 ; Route10Text9
	bg_event  5, 41, 10 ; Route10Text10

	def_objects
	object SPRITE_SUPER_NERD, 10, 44, STAY, LEFT, 1, OPP_POKEMANIAC, 1
	object SPRITE_HIKER, 3, 57, STAY, UP, 2, OPP_HIKER, 7
	object SPRITE_SUPER_NERD, 14, 64, STAY, LEFT, 3, OPP_POKEMANIAC, 2
	object SPRITE_COOLTRAINER_F, 7, 25, STAY, LEFT, 4, OPP_JR_TRAINER_F, 7
	object SPRITE_HIKER, 3, 61, STAY, DOWN, 5, OPP_HIKER, 8
	object SPRITE_COOLTRAINER_F, 7, 54, STAY, DOWN, 6, OPP_JR_TRAINER_F, 8

	def_warps_to ROUTE_10
