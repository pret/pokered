Route10Object:
	db $2c ; border block

	db $4 ; warps
	warp $b, $13, $0, ROCK_TUNNEL_POKECENTER
	warp $8, $11, $0, ROCK_TUNNEL_1
	warp $8, $35, $2, ROCK_TUNNEL_1
	warp $6, $27, $0, POWER_PLANT

	db $4 ; signs
	sign $7, $13, $7 ; Route10Text7
	sign $c, $13, $8 ; PokeCenterSignText
	sign $9, $37, $9 ; Route10Text9
	sign $5, $29, $a ; Route10Text10

	db $6 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $a, $2c, STAY, LEFT, $1, OPP_POKEMANIAC, $1
	object SPRITE_HIKER, $3, $39, STAY, UP, $2, OPP_HIKER, $7
	object SPRITE_BLACK_HAIR_BOY_2, $e, $40, STAY, LEFT, $3, OPP_POKEMANIAC, $2
	object SPRITE_LASS, $7, $19, STAY, LEFT, $4, OPP_JR_TRAINER_F, $7
	object SPRITE_HIKER, $3, $3d, STAY, DOWN, $5, OPP_HIKER, $8
	object SPRITE_LASS, $7, $36, STAY, DOWN, $6, OPP_JR_TRAINER_F, $8

	; warp-to
	warp_to $b, $13, ROUTE_10_WIDTH ; ROCK_TUNNEL_POKECENTER
	warp_to $8, $11, ROUTE_10_WIDTH ; ROCK_TUNNEL_1
	warp_to $8, $35, ROUTE_10_WIDTH ; ROCK_TUNNEL_1
	warp_to $6, $27, ROUTE_10_WIDTH ; POWER_PLANT
