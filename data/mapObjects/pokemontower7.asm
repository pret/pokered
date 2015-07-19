PokemonTower7Object: ; 0x60ef6 (size=42)
	db $1 ; border block

	db $1 ; warps
	db $10, $9, $1, POKEMONTOWER_6

	db $0 ; signs

IF DEF(_YELLOW)
	db 3 ; objects
	object SPRITE_JESSIE, $a 8, 8, FACE, DOWN, 1
	object SPRITE_JAMES, $b, 8, FACE, DOWN, 2
	object SPRITE_MR_FUJI, $a, 3, FACE, DOWN, 3
ELSE
	db $4 ; objects
	object SPRITE_ROCKET, $9, $b, FACE, LEFT, $1, ROCKET + $C8, $13
	object SPRITE_ROCKET, $c, $9, FACE, RIGHT, $2, ROCKET + $C8, $14
	object SPRITE_ROCKET, $9, $7, FACE, LEFT, $3, ROCKET + $C8, $15
	object SPRITE_MR_FUJI, $a, $3, FACE, DOWN, $4 ; person
ENDC

	; warp-to
	EVENT_DISP POKEMONTOWER_7_WIDTH, $10, $9 ; POKEMONTOWER_6
