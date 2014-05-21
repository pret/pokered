PokemonTower6Object: ; 0x60c5b (size=58)
	db $1 ; border block

	db $2 ; warps
	db $9, $12, $1, POKEMONTOWER_5
	db $10, $9, $0, POKEMONTOWER_7

	db $0 ; signs

	db $5 ; people
	db SPRITE_MEDIUM, $a + 4, $c + 4, $ff, $d3, TRAINER | $1, CHANNELER + $C8, $13
	db SPRITE_MEDIUM, $5 + 4, $9 + 4, $ff, $d0, TRAINER | $2, CHANNELER + $C8, $14
	db SPRITE_MEDIUM, $5 + 4, $10 + 4, $ff, $d2, TRAINER | $3, CHANNELER + $C8, $15
	db SPRITE_BALL, $8 + 4, $6 + 4, $ff, $ff, ITEM | $4, RARE_CANDY
	db SPRITE_BALL, $e + 4, $e + 4, $ff, $ff, ITEM | $5, X_ACCURACY

	; warp-to
	EVENT_DISP POKEMONTOWER_6_WIDTH, $9, $12 ; POKEMONTOWER_5
	EVENT_DISP POKEMONTOWER_6_WIDTH, $10, $9 ; POKEMONTOWER_7
