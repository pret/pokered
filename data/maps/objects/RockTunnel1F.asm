RockTunnel1F_Object:
	db $3 ; border block

	def_warps
	warp 15,  3, 1, LAST_MAP
	warp 15,  0, 1, LAST_MAP
	warp 15, 33, 2, LAST_MAP
	warp 15, 35, 2, LAST_MAP
	warp 37,  3, 0, ROCK_TUNNEL_B1F
	warp  5,  3, 1, ROCK_TUNNEL_B1F
	warp 17, 11, 2, ROCK_TUNNEL_B1F
	warp 37, 17, 3, ROCK_TUNNEL_B1F

	def_signs
	sign 11, 29, 8 ; RockTunnel1Text8

	def_objects
	object SPRITE_HIKER, 7, 5, STAY, DOWN, 1, OPP_HIKER, 12
	object SPRITE_HIKER, 5, 16, STAY, DOWN, 2, OPP_HIKER, 13
	object SPRITE_HIKER, 17, 15, STAY, LEFT, 3, OPP_HIKER, 14
	object SPRITE_SUPER_NERD, 23, 8, STAY, LEFT, 4, OPP_POKEMANIAC, 7
	object SPRITE_COOLTRAINER_F, 37, 21, STAY, LEFT, 5, OPP_JR_TRAINER_F, 17
	object SPRITE_COOLTRAINER_F, 22, 24, STAY, DOWN, 6, OPP_JR_TRAINER_F, 18
	object SPRITE_COOLTRAINER_F, 32, 24, STAY, RIGHT, 7, OPP_JR_TRAINER_F, 19

	def_warps_to ROCK_TUNNEL_1F
