PokemonTower5Object: ; 0x60a48 (size=65)
	db $1 ; border block

	db $2 ; warps
	db $9, $3, $0, POKEMONTOWER_4
	db $9, $12, $0, POKEMONTOWER_6

	db $0 ; signs

	db $6 ; objects
	object SPRITE_MEDIUM, $c, $8, FACE, STAY, $1 ; person
	object SPRITE_MEDIUM, $11, $7, FACE, RIGHT, $2, CHANNELER + $C8, $e
	object SPRITE_MEDIUM, $e, $3, FACE, RIGHT, $3, CHANNELER + $C8, $10
	object SPRITE_MEDIUM, $6, $a, FACE, LEFT, $4, CHANNELER + $C8, $11
	object SPRITE_MEDIUM, $9, $10, FACE, LEFT, $5, CHANNELER + $C8, $12
	object SPRITE_BALL, $6, $e, FACE, STAY, $6, NUGGET

	; warp-to
	EVENT_DISP POKEMONTOWER_5_WIDTH, $9, $3 ; POKEMONTOWER_4
	EVENT_DISP POKEMONTOWER_5_WIDTH, $9, $12 ; POKEMONTOWER_6
