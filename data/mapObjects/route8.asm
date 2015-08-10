Route8Object: ; 0x5814f (size=119)
	db $2c ; border block

	db $5 ; warps
	db $9, $1, $0, ROUTE_8_GATE
	db $a, $1, $1, ROUTE_8_GATE
	db $9, $8, $2, ROUTE_8_GATE
	db $a, $8, $3, ROUTE_8_GATE
	db $3, $d, $0, PATH_ENTRANCE_ROUTE_8

	db $1 ; signs
	db $3, $11, $a ; Route8Text10

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
	EVENT_DISP ROUTE_8_WIDTH, $9, $1 ; ROUTE_8_GATE
	EVENT_DISP ROUTE_8_WIDTH, $a, $1 ; ROUTE_8_GATE
	EVENT_DISP ROUTE_8_WIDTH, $9, $8 ; ROUTE_8_GATE
	EVENT_DISP ROUTE_8_WIDTH, $a, $8 ; ROUTE_8_GATE
	EVENT_DISP ROUTE_8_WIDTH, $3, $d ; PATH_ENTRANCE_ROUTE_8
