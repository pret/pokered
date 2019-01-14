Route10_Object:
	db $2c ; border block

	db 4 ; warps
	warp 11, 19, 0, ROCK_TUNNEL_POKECENTER
	warp 8, 17, 0, ROCK_TUNNEL_1F
	warp 8, 53, 2, ROCK_TUNNEL_1F
	warp 6, 39, 0, POWER_PLANT

	db 4 ; signs
	sign 7, 19, 7 ; Route10Text7
	sign 12, 19, 8 ; PokeCenterSignText
	sign 9, 55, 9 ; Route10Text9
	sign 5, 41, 10 ; Route10Text10

	db 6 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, 10, 44, STAY, LEFT, 1, OPP_POKEMANIAC, 1
	object SPRITE_HIKER, 3, 57, STAY, UP, 2, OPP_HIKER, 7
	object SPRITE_BLACK_HAIR_BOY_2, 14, 64, STAY, LEFT, 3, OPP_POKEMANIAC, 2
	object SPRITE_LASS, 7, 25, STAY, LEFT, 4, OPP_JR_TRAINER_F, 7
	object SPRITE_HIKER, 3, 61, STAY, DOWN, 5, OPP_HIKER, 8
	object SPRITE_LASS, 7, 54, STAY, DOWN, 6, OPP_JR_TRAINER_F, 8

	; warp-to
	warp_to 11, 19, ROUTE_10_WIDTH ; ROCK_TUNNEL_POKECENTER
	warp_to 8, 17, ROUTE_10_WIDTH ; ROCK_TUNNEL_1F
	warp_to 8, 53, ROUTE_10_WIDTH ; ROCK_TUNNEL_1F
	warp_to 6, 39, ROUTE_10_WIDTH ; POWER_PLANT
