PokemonTower5Object: ; 0x60a48 (size=65)
	db $1 ; border block

	db $2 ; warps
	db $9, $3, $0, POKEMONTOWER_4
	db $9, $12, $0, POKEMONTOWER_6

	db $0 ; signs

	db $6 ; people
	db SPRITE_MEDIUM, $8 + 4, $c + 4, $ff, $ff, $1 ; person
	db SPRITE_MEDIUM, $7 + 4, $11 + 4, $ff, $d2, TRAINER | $2, CHANNELER + $C8, $e
	db SPRITE_MEDIUM, $3 + 4, $e + 4, $ff, $d2, TRAINER | $3, CHANNELER + $C8, $10
	db SPRITE_MEDIUM, $a + 4, $6 + 4, $ff, $d3, TRAINER | $4, CHANNELER + $C8, $11
	db SPRITE_MEDIUM, $10 + 4, $9 + 4, $ff, $d3, TRAINER | $5, CHANNELER + $C8, $12
	db SPRITE_BALL, $e + 4, $6 + 4, $ff, $ff, ITEM | $6, NUGGET

	; warp-to
	EVENT_DISP POKEMONTOWER_5_WIDTH, $9, $3 ; POKEMONTOWER_4
	EVENT_DISP POKEMONTOWER_5_WIDTH, $9, $12 ; POKEMONTOWER_6
