PokemonTower6Object: ; 0x60c5b (size=58)
	db $1 ; border block

	db $2 ; warps
	db $9, $12, $1, POKEMONTOWER_5
	db $10, $9, $0, POKEMONTOWER_7

	db $0 ; signs

	db $5 ; people
	db SPRITE_MEDIUM, $a + 4, $c + 4, $ff, $d3, $41, CHANNELER + $C8, $13 ; trainer
	db SPRITE_MEDIUM, $5 + 4, $9 + 4, $ff, $d0, $42, CHANNELER + $C8, $14 ; trainer
	db SPRITE_MEDIUM, $5 + 4, $10 + 4, $ff, $d2, $43, CHANNELER + $C8, $15 ; trainer
	db SPRITE_BALL, $8 + 4, $6 + 4, $ff, $ff, $84, RARE_CANDY ; item
	db SPRITE_BALL, $e + 4, $e + 4, $ff, $ff, $85, X_ACCURACY ; item

	; warp-to
	EVENT_DISP POKEMONTOWER_6_WIDTH, $9, $12 ; POKEMONTOWER_5
	EVENT_DISP POKEMONTOWER_6_WIDTH, $10, $9 ; POKEMONTOWER_7
