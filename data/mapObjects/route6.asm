Route6Object:
	db $f ; border block

	db $4 ; warps
	warp $9, $1, $2, ROUTE_6_GATE
	warp $a, $1, $2, ROUTE_6_GATE
	warp $a, $7, $0, ROUTE_6_GATE
	warp $11, $d, $0, PATH_ENTRANCE_ROUTE_6

	db $1 ; signs
	sign $13, $f, $7 ; Route6Text7

	db $6 ; objects
	object SPRITE_BLACK_HAIR_BOY_1, $a, $15, STAY, RIGHT, $1, OPP_JR_TRAINER_M, $4
	object SPRITE_LASS, $b, $15, STAY, LEFT, $2, OPP_JR_TRAINER_F, $2
	object SPRITE_BUG_CATCHER, $0, $f, STAY, RIGHT, $3, OPP_BUG_CATCHER, $a
	object SPRITE_BLACK_HAIR_BOY_1, $b, $1f, STAY, LEFT, $4, OPP_JR_TRAINER_M, $5
	object SPRITE_LASS, $b, $1e, STAY, LEFT, $5, OPP_JR_TRAINER_F, $3
	object SPRITE_BUG_CATCHER, $13, $1a, STAY, LEFT, $6, OPP_BUG_CATCHER, $b

	; warp-to
	warp_to $9, $1, ROUTE_6_WIDTH ; ROUTE_6_GATE
	warp_to $a, $1, ROUTE_6_WIDTH ; ROUTE_6_GATE
	warp_to $a, $7, ROUTE_6_WIDTH ; ROUTE_6_GATE
	warp_to $11, $d, ROUTE_6_WIDTH ; PATH_ENTRANCE_ROUTE_6
