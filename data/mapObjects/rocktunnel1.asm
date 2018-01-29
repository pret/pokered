RockTunnel1Object:
	db $3 ; border block

	db $8 ; warps
	warp $f, $3, $1, $ff
	warp $f, $0, $1, $ff
	warp $f, $21, $2, $ff
	warp $f, $23, $2, $ff
	warp $25, $3, $0, ROCK_TUNNEL_2
	warp $5, $3, $1, ROCK_TUNNEL_2
	warp $11, $b, $2, ROCK_TUNNEL_2
	warp $25, $11, $3, ROCK_TUNNEL_2

	db $1 ; signs
	sign $b, $1d, $8 ; RockTunnel1Text8

	db $7 ; objects
	object SPRITE_HIKER, $7, $5, STAY, DOWN, $1, OPP_HIKER, $c
	object SPRITE_HIKER, $5, $10, STAY, DOWN, $2, OPP_HIKER, $d
	object SPRITE_HIKER, $11, $f, STAY, LEFT, $3, OPP_HIKER, $e
	object SPRITE_BLACK_HAIR_BOY_2, $17, $8, STAY, LEFT, $4, OPP_POKEMANIAC, $7
	object SPRITE_LASS, $25, $15, STAY, LEFT, $5, OPP_JR_TRAINER_F, $11
	object SPRITE_LASS, $16, $18, STAY, DOWN, $6, OPP_JR_TRAINER_F, $12
	object SPRITE_LASS, $20, $18, STAY, RIGHT, $7, OPP_JR_TRAINER_F, $13

	; warp-to
	warp_to $f, $3, ROCK_TUNNEL_1_WIDTH
	warp_to $f, $0, ROCK_TUNNEL_1_WIDTH
	warp_to $f, $21, ROCK_TUNNEL_1_WIDTH
	warp_to $f, $23, ROCK_TUNNEL_1_WIDTH
	warp_to $25, $3, ROCK_TUNNEL_1_WIDTH ; ROCK_TUNNEL_2
	warp_to $5, $3, ROCK_TUNNEL_1_WIDTH ; ROCK_TUNNEL_2
	warp_to $11, $b, ROCK_TUNNEL_1_WIDTH ; ROCK_TUNNEL_2
	warp_to $25, $11, ROCK_TUNNEL_1_WIDTH ; ROCK_TUNNEL_2
