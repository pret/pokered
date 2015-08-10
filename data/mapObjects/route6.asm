Route6Object: ; 0x58022 (size=87)
	db $f ; border block

	db $4 ; warps
	db $1, $9, $2, ROUTE_6_GATE
	db $1, $a, $2, ROUTE_6_GATE
	db $7, $a, $0, ROUTE_6_GATE
	db $d, $11, $0, PATH_ENTRANCE_ROUTE_6

	db $1 ; signs
	db $f, $13, $7 ; Route6Text7

	db $6 ; objects
	object SPRITE_BLACK_HAIR_BOY_1, $a, $15, STAY, RIGHT, $1, OPP_JR__TRAINER_M, $4
	object SPRITE_LASS, $b, $15, STAY, LEFT, $2, OPP_JR__TRAINER_F, $2
	object SPRITE_BUG_CATCHER, $0, $f, STAY, RIGHT, $3, OPP_BUG_CATCHER, $a
	object SPRITE_BLACK_HAIR_BOY_1, $b, $1f, STAY, LEFT, $4, OPP_JR__TRAINER_M, $5
	object SPRITE_LASS, $b, $1e, STAY, LEFT, $5, OPP_JR__TRAINER_F, $3
	object SPRITE_BUG_CATCHER, $13, $1a, STAY, LEFT, $6, OPP_BUG_CATCHER, $b

	; warp-to
	EVENT_DISP ROUTE_6_WIDTH, $1, $9 ; ROUTE_6_GATE
	EVENT_DISP ROUTE_6_WIDTH, $1, $a ; ROUTE_6_GATE
	EVENT_DISP ROUTE_6_WIDTH, $7, $a ; ROUTE_6_GATE
	EVENT_DISP ROUTE_6_WIDTH, $d, $11 ; PATH_ENTRANCE_ROUTE_6
