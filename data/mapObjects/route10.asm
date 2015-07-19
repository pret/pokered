Route10Object: ; 0x582f6 (size=96)
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
	object SPRITE_BLACK_HAIR_BOY_2, $a, $2c, FACE, RIGHT, $1, POKEMANIAC + $C8, $1
	object SPRITE_HIKER, $3, $39, FACE, UP, $2, HIKER + $C8, $7
	object SPRITE_BLACK_HAIR_BOY_2, $e, $40, FACE, RIGHT, $3, POKEMANIAC + $C8, $2
	object SPRITE_LASS, $7, $19, FACE, RIGHT, $4, JR__TRAINER_F + $C8, $7
	object SPRITE_HIKER, $3, $3d, FACE, DOWN, $5, HIKER + $C8, $8
	object SPRITE_LASS, $7, $36, FACE, DOWN, $6, JR__TRAINER_F + $C8, $8

	; warp-to
	EVENT_DISP ROUTE_10_WIDTH, $13, $b ; ROCK_TUNNEL_POKECENTER
	EVENT_DISP ROUTE_10_WIDTH, $11, $8 ; ROCK_TUNNEL_1
	EVENT_DISP ROUTE_10_WIDTH, $35, $8 ; ROCK_TUNNEL_1
	EVENT_DISP ROUTE_10_WIDTH, $27, $6 ; POWER_PLANT
