PokemonTower1Object:
	db $1 ; border block

	db $3 ; warps
	warp $a, $11, $1, $ff
	warp $b, $11, $1, $ff
	warp $12, $9, $1, POKEMONTOWER_2

	db $0 ; signs

	db $5 ; objects
	object SPRITE_CABLE_CLUB_WOMAN, $f, $d, STAY, UP, $1 ; person
	object SPRITE_MOM_GEISHA, $6, $8, STAY, NONE, $2 ; person
	object SPRITE_BALDING_GUY, $8, $c, STAY, NONE, $3 ; person
	object SPRITE_GIRL, $d, $7, STAY, NONE, $4 ; person
	object SPRITE_MEDIUM, $11, $7, STAY, LEFT, $5 ; person

	; warp-to
	warp_to $a, $11, POKEMONTOWER_1_WIDTH
	warp_to $b, $11, POKEMONTOWER_1_WIDTH
	warp_to $12, $9, POKEMONTOWER_1_WIDTH ; POKEMONTOWER_2
