PokemonTower3Object: ; 0x6075d (size=51)
	db $1 ; border block

	db $2 ; warps
	db $9, $3, $0, POKEMONTOWER_2
	db $9, $12, $1, POKEMONTOWER_4

	db $0 ; signs

	db $4 ; objects
	object SPRITE_MEDIUM, $c, $3, STAY, LEFT, $1, CHANNELER + $C8, $5
	object SPRITE_MEDIUM, $9, $8, STAY, DOWN, $2, CHANNELER + $C8, $6
	object SPRITE_MEDIUM, $a, $d, STAY, DOWN, $3, CHANNELER + $C8, $8
	object SPRITE_BALL, $c, $1, STAY, NONE, $4, ESCAPE_ROPE

	; warp-to
	EVENT_DISP POKEMONTOWER_3_WIDTH, $9, $3 ; POKEMONTOWER_2
	EVENT_DISP POKEMONTOWER_3_WIDTH, $9, $12 ; POKEMONTOWER_4
