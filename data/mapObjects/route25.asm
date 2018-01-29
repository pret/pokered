Route25Object:
	db $2c ; border block

	db $1 ; warps
	warp $2d, $3, $0, BILLS_HOUSE

	db $1 ; signs
	sign $2b, $3, $b ; Route25Text11

	db $a ; objects
	object SPRITE_BUG_CATCHER, $e, $2, STAY, DOWN, $1, OPP_YOUNGSTER, $5
	object SPRITE_BUG_CATCHER, $12, $5, STAY, UP, $2, OPP_YOUNGSTER, $6
	object SPRITE_BLACK_HAIR_BOY_1, $18, $4, STAY, DOWN, $3, OPP_JR_TRAINER_M, $2
	object SPRITE_LASS, $12, $8, STAY, RIGHT, $4, OPP_LASS, $9
	object SPRITE_BUG_CATCHER, $20, $3, STAY, LEFT, $5, OPP_YOUNGSTER, $7
	object SPRITE_LASS, $25, $4, STAY, DOWN, $6, OPP_LASS, $a
	object SPRITE_HIKER, $8, $4, STAY, RIGHT, $7, OPP_HIKER, $2
	object SPRITE_HIKER, $17, $9, STAY, UP, $8, OPP_HIKER, $3
	object SPRITE_HIKER, $d, $7, STAY, RIGHT, $9, OPP_HIKER, $4
	object SPRITE_BALL, $16, $2, STAY, NONE, $a, TM_19

	; warp-to
	warp_to $2d, $3, ROUTE_25_WIDTH ; BILLS_HOUSE
