RockTunnel2Object: ; 0x4613d (size=100)
	db $3 ; border block

	db $4 ; warps
	db $19, $21, $4, ROCK_TUNNEL_1
	db $3, $1b, $5, ROCK_TUNNEL_1
	db $b, $17, $6, ROCK_TUNNEL_1
	db $3, $3, $7, ROCK_TUNNEL_1

	db $0 ; signs

	db $8 ; objects
	object SPRITE_LASS, $b, $d, STAY, DOWN, $1, JR__TRAINER_F + $C8, $9
	object SPRITE_HIKER, $6, $a, STAY, DOWN, $2, HIKER + $C8, $9
	object SPRITE_BLACK_HAIR_BOY_2, $3, $5, STAY, DOWN, $3, POKEMANIAC + $C8, $3
	object SPRITE_BLACK_HAIR_BOY_2, $14, $15, STAY, RIGHT, $4, POKEMANIAC + $C8, $4
	object SPRITE_HIKER, $1e, $a, STAY, DOWN, $5, HIKER + $C8, $a
	object SPRITE_LASS, $e, $1c, STAY, RIGHT, $6, JR__TRAINER_F + $C8, $a
	object SPRITE_HIKER, $21, $5, STAY, RIGHT, $7, HIKER + $C8, $b
	object SPRITE_BLACK_HAIR_BOY_2, $1a, $1e, STAY, DOWN, $8, POKEMANIAC + $C8, $5

	; warp-to
	EVENT_DISP ROCK_TUNNEL_2_WIDTH, $19, $21 ; ROCK_TUNNEL_1
	EVENT_DISP ROCK_TUNNEL_2_WIDTH, $3, $1b ; ROCK_TUNNEL_1
	EVENT_DISP ROCK_TUNNEL_2_WIDTH, $b, $17 ; ROCK_TUNNEL_1
	EVENT_DISP ROCK_TUNNEL_2_WIDTH, $3, $3 ; ROCK_TUNNEL_1
