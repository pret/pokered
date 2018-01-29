Route8Object:
	db $2c ; border block

	db $5 ; warps
	warp $1, $9, $0, ROUTE_8_GATE
	warp $1, $a, $1, ROUTE_8_GATE
	warp $8, $9, $2, ROUTE_8_GATE
	warp $8, $a, $3, ROUTE_8_GATE
	warp $d, $3, $0, PATH_ENTRANCE_ROUTE_8

	db $1 ; signs
	sign $11, $3, $a ; Route8Text10

	db $9 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $8, $5, STAY, RIGHT, $1, OPP_SUPER_NERD, $3
	object SPRITE_GAMBLER, $d, $9, STAY, UP, $2, OPP_GAMBLER, $5
	object SPRITE_BLACK_HAIR_BOY_2, $2a, $6, STAY, UP, $3, OPP_SUPER_NERD, $4
	object SPRITE_LASS, $1a, $3, STAY, LEFT, $4, OPP_LASS, $d
	object SPRITE_BLACK_HAIR_BOY_2, $1a, $4, STAY, RIGHT, $5, OPP_SUPER_NERD, $5
	object SPRITE_LASS, $1a, $5, STAY, LEFT, $6, OPP_LASS, $e
	object SPRITE_LASS, $1a, $6, STAY, RIGHT, $7, OPP_LASS, $f
	object SPRITE_GAMBLER, $2e, $d, STAY, DOWN, $8, OPP_GAMBLER, $7
	object SPRITE_LASS, $33, $c, STAY, LEFT, $9, OPP_LASS, $10

	; warp-to
	warp_to $1, $9, ROUTE_8_WIDTH ; ROUTE_8_GATE
	warp_to $1, $a, ROUTE_8_WIDTH ; ROUTE_8_GATE
	warp_to $8, $9, ROUTE_8_WIDTH ; ROUTE_8_GATE
	warp_to $8, $a, ROUTE_8_WIDTH ; ROUTE_8_GATE
	warp_to $d, $3, ROUTE_8_WIDTH ; PATH_ENTRANCE_ROUTE_8
