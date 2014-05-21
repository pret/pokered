PokemonTower3Object: ; 0x6075d (size=51)
	db $1 ; border block

	db $2 ; warps
	db $9, $3, $0, POKEMONTOWER_2
	db $9, $12, $1, POKEMONTOWER_4

	db $0 ; signs

	db $4 ; people
	db SPRITE_MEDIUM, $3 + 4, $c + 4, $ff, $d2, TRAINER | $1, CHANNELER + $C8, $5
	db SPRITE_MEDIUM, $8 + 4, $9 + 4, $ff, $d0, TRAINER | $2, CHANNELER + $C8, $6
	db SPRITE_MEDIUM, $d + 4, $a + 4, $ff, $d0, TRAINER | $3, CHANNELER + $C8, $8
	db SPRITE_BALL, $1 + 4, $c + 4, $ff, $ff, ITEM | $4, ESCAPE_ROPE

	; warp-to
	EVENT_DISP POKEMONTOWER_3_WIDTH, $9, $3 ; POKEMONTOWER_2
	EVENT_DISP POKEMONTOWER_3_WIDTH, $9, $12 ; POKEMONTOWER_4
