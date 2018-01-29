SSAnne5Object:
	db $23 ; border block

	db $2 ; warps
	warp $d, $6, $0, SS_ANNE_3
	warp $d, $7, $0, SS_ANNE_3

	db $0 ; signs

	db $5 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $5, $2, STAY, UP, $1 ; person
	object SPRITE_SAILOR, $4, $9, STAY, NONE, $2 ; person
	object SPRITE_BLACK_HAIR_BOY_1, $7, $b, STAY, NONE, $3 ; person
	object SPRITE_SAILOR, $4, $4, STAY, DOWN, $4, OPP_SAILOR, $1
	object SPRITE_SAILOR, $a, $8, STAY, UP, $5, OPP_SAILOR, $2

	; warp-to
	warp_to $d, $6, SS_ANNE_5_WIDTH ; SS_ANNE_3
	warp_to $d, $7, SS_ANNE_5_WIDTH ; SS_ANNE_3
