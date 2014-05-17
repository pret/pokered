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

	db $6 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $2c + 4, $a + 4, $ff, $d2, $41, POKEMANIAC + $C8, $1 ; trainer
	db SPRITE_HIKER, $39 + 4, $3 + 4, $ff, $d1, $42, HIKER + $C8, $7 ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $40 + 4, $e + 4, $ff, $d2, $43, POKEMANIAC + $C8, $2 ; trainer
	db SPRITE_LASS, $19 + 4, $7 + 4, $ff, $d2, $44, JR__TRAINER_F + $C8, $7 ; trainer
	db SPRITE_HIKER, $3d + 4, $3 + 4, $ff, $d0, $45, HIKER + $C8, $8 ; trainer
	db SPRITE_LASS, $36 + 4, $7 + 4, $ff, $d0, $46, JR__TRAINER_F + $C8, $8 ; trainer

	; warp-to
	EVENT_DISP ROUTE_10_WIDTH, $13, $b ; ROCK_TUNNEL_POKECENTER
	EVENT_DISP ROUTE_10_WIDTH, $11, $8 ; ROCK_TUNNEL_1
	EVENT_DISP ROUTE_10_WIDTH, $35, $8 ; ROCK_TUNNEL_1
	EVENT_DISP ROUTE_10_WIDTH, $27, $6 ; POWER_PLANT
