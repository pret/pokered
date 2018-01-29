Route11Object:
	db $f ; border block

	db $5 ; warps
	warp $31, $8, $0, ROUTE_11_GATE_1F
	warp $31, $9, $1, ROUTE_11_GATE_1F
	warp $3a, $8, $2, ROUTE_11_GATE_1F
	warp $3a, $9, $3, ROUTE_11_GATE_1F
	warp $4, $5, $0, DIGLETTS_CAVE_ENTRANCE

	db $1 ; signs
	sign $1, $5, $b ; Route11Text11

	db $a ; objects
	object SPRITE_GAMBLER, $a, $e, STAY, DOWN, $1, OPP_GAMBLER, $1
	object SPRITE_GAMBLER, $1a, $9, STAY, DOWN, $2, OPP_GAMBLER, $2
	object SPRITE_BUG_CATCHER, $d, $5, STAY, LEFT, $3, OPP_YOUNGSTER, $9
	object SPRITE_BLACK_HAIR_BOY_2, $24, $b, STAY, DOWN, $4, OPP_ENGINEER, $2
	object SPRITE_BUG_CATCHER, $16, $4, STAY, UP, $5, OPP_YOUNGSTER, $a
	object SPRITE_GAMBLER, $2d, $7, STAY, DOWN, $6, OPP_GAMBLER, $3
	object SPRITE_GAMBLER, $21, $3, STAY, UP, $7, OPP_GAMBLER, $4
	object SPRITE_BUG_CATCHER, $2b, $5, STAY, RIGHT, $8, OPP_YOUNGSTER, $b
	object SPRITE_BLACK_HAIR_BOY_2, $2d, $10, STAY, LEFT, $9, OPP_ENGINEER, $3
	object SPRITE_BUG_CATCHER, $16, $c, STAY, UP, $a, OPP_YOUNGSTER, $c

	; warp-to
	warp_to $31, $8, ROUTE_11_WIDTH ; ROUTE_11_GATE_1F
	warp_to $31, $9, ROUTE_11_WIDTH ; ROUTE_11_GATE_1F
	warp_to $3a, $8, ROUTE_11_WIDTH ; ROUTE_11_GATE_1F
	warp_to $3a, $9, ROUTE_11_WIDTH ; ROUTE_11_GATE_1F
	warp_to $4, $5, ROUTE_11_WIDTH ; DIGLETTS_CAVE_ENTRANCE
