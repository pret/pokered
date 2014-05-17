PokemonTower4Object: ; 0x6088b (size=65)
	db $1 ; border block

	db $2 ; warps
	db $9, $3, $0, POKEMONTOWER_5
	db $9, $12, $1, POKEMONTOWER_3

	db $0 ; signs

	db $6 ; people
	db SPRITE_MEDIUM, $a + 4, $5 + 4, $ff, $d3, $41, CHANNELER + $C8, $9 ; trainer
	db SPRITE_MEDIUM, $7 + 4, $f + 4, $ff, $d0, $42, CHANNELER + $C8, $a ; trainer
	db SPRITE_MEDIUM, $c + 4, $e + 4, $ff, $d2, $43, CHANNELER + $C8, $c ; trainer
	db SPRITE_BALL, $a + 4, $c + 4, $ff, $ff, $84, ELIXER ; item
	db SPRITE_BALL, $a + 4, $9 + 4, $ff, $ff, $85, AWAKENING ; item
	db SPRITE_BALL, $10 + 4, $c + 4, $ff, $ff, $86, HP_UP ; item

	; warp-to
	EVENT_DISP POKEMONTOWER_4_WIDTH, $9, $3 ; POKEMONTOWER_5
	EVENT_DISP POKEMONTOWER_4_WIDTH, $9, $12 ; POKEMONTOWER_3
