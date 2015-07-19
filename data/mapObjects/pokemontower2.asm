PokemonTower2Object: ; 0x60646 (size=32)
	db $1 ; border block

	db $2 ; warps
	db $9, $3, $0, POKEMONTOWER_3
	db $9, $12, $2, POKEMONTOWER_1

	db $0 ; signs

	db $2 ; objects
	object SPRITE_BLUE, $e, $5, FACE, STAY, $1 ; person
	object SPRITE_MEDIUM, $3, $7, FACE, LEFT, $2 ; person

	; warp-to
	EVENT_DISP POKEMONTOWER_2_WIDTH, $9, $3 ; POKEMONTOWER_3
	EVENT_DISP POKEMONTOWER_2_WIDTH, $9, $12 ; POKEMONTOWER_1
