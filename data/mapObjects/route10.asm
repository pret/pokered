Route10Object:
	db $2c ; border block

	db $4 ; warps
	db $13, $b, $0, ROCK_TUNNEL_POKECENTER
	db $11, $8, $0, ROCK_TUNNEL_1
	db $35, $8, $2, ROCK_TUNNEL_1
	db $27, $6, $0, POWER_PLANT

	db $4 ; signs
	db $13, $7, $7 ; Route10Text7
	db $13, $c, $8 ; PokeCenterSignText
	db $37, $9, $9 ; Route10Text9
	db $29, $5, $a ; Route10Text10

	db $6 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $a, $2c, STAY, LEFT, $1, OPP_POKEMANIAC, $1
	object SPRITE_HIKER, $3, $39, STAY, UP, $2, OPP_HIKER, $7
	object SPRITE_BLACK_HAIR_BOY_2, $e, $40, STAY, LEFT, $3, OPP_POKEMANIAC, $2
	object SPRITE_LASS, $7, $19, STAY, LEFT, $4, OPP_JR_TRAINER_F, $7
	object SPRITE_HIKER, $3, $3d, STAY, DOWN, $5, OPP_HIKER, $8
	object SPRITE_LASS, $7, $36, STAY, DOWN, $6, OPP_JR_TRAINER_F, $8

	; warp-to
	EVENT_DISP ROUTE_10_WIDTH, $13, $b ; ROCK_TUNNEL_POKECENTER
	EVENT_DISP ROUTE_10_WIDTH, $11, $8 ; ROCK_TUNNEL_1
	EVENT_DISP ROUTE_10_WIDTH, $35, $8 ; ROCK_TUNNEL_1
	EVENT_DISP ROUTE_10_WIDTH, $27, $6 ; POWER_PLANT
