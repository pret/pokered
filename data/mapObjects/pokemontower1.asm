PokemonTower1Object: ; 0x60452 (size=58)
	db $1 ; border block

	db $3 ; warps
	db $11, $a, $1, $ff
	db $11, $b, $1, $ff
	db $9, $12, $1, POKEMONTOWER_2

	db $0 ; signs

	db $5 ; objects
	object SPRITE_CABLE_CLUB_WOMAN, $f, $d, FACE, UP, $1 ; person
	object SPRITE_MOM_GEISHA, $6, $8, FACE, STAY, $2 ; person
	object SPRITE_BALDING_GUY, $8, $c, FACE, STAY, $3 ; person
	object SPRITE_GIRL, $d, $7, FACE, STAY, $4 ; person
	object SPRITE_MEDIUM, $11, $7, FACE, RIGHT, $5 ; person

	; warp-to
	EVENT_DISP POKEMONTOWER_1_WIDTH, $11, $a
	EVENT_DISP POKEMONTOWER_1_WIDTH, $11, $b
	EVENT_DISP POKEMONTOWER_1_WIDTH, $9, $12 ; POKEMONTOWER_2
