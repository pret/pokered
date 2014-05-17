RockTunnel2Object: ; 0x4613d (size=100)
	db $3 ; border block

	db $4 ; warps
	db $19, $21, $4, ROCK_TUNNEL_1
	db $3, $1b, $5, ROCK_TUNNEL_1
	db $b, $17, $6, ROCK_TUNNEL_1
	db $3, $3, $7, ROCK_TUNNEL_1

	db $0 ; signs

	db $8 ; people
	db SPRITE_LASS, $d + 4, $b + 4, $ff, $d0, $41, JR__TRAINER_F + $C8, $9 ; trainer
	db SPRITE_HIKER, $a + 4, $6 + 4, $ff, $d0, $42, HIKER + $C8, $9 ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $5 + 4, $3 + 4, $ff, $d0, $43, POKEMANIAC + $C8, $3 ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $15 + 4, $14 + 4, $ff, $d3, $44, POKEMANIAC + $C8, $4 ; trainer
	db SPRITE_HIKER, $a + 4, $1e + 4, $ff, $d0, $45, HIKER + $C8, $a ; trainer
	db SPRITE_LASS, $1c + 4, $e + 4, $ff, $d3, $46, JR__TRAINER_F + $C8, $a ; trainer
	db SPRITE_HIKER, $5 + 4, $21 + 4, $ff, $d3, $47, HIKER + $C8, $b ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $1e + 4, $1a + 4, $ff, $d0, $48, POKEMANIAC + $C8, $5 ; trainer

	; warp-to
	EVENT_DISP ROCK_TUNNEL_2_WIDTH, $19, $21 ; ROCK_TUNNEL_1
	EVENT_DISP ROCK_TUNNEL_2_WIDTH, $3, $1b ; ROCK_TUNNEL_1
	EVENT_DISP ROCK_TUNNEL_2_WIDTH, $b, $17 ; ROCK_TUNNEL_1
	EVENT_DISP ROCK_TUNNEL_2_WIDTH, $3, $3 ; ROCK_TUNNEL_1
