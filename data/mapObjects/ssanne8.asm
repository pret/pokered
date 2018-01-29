SSAnne8Object:
	db $c ; border block

	db $6 ; warps
	warp $0, $0, $2, SS_ANNE_1
	warp $a, $0, $3, SS_ANNE_1
	warp $14, $0, $4, SS_ANNE_1
	warp $0, $a, $5, SS_ANNE_1
	warp $a, $a, $6, SS_ANNE_1
	warp $14, $a, $7, SS_ANNE_1

	db $0 ; signs

	db $b ; objects
	object SPRITE_GENTLEMAN, $2, $3, STAY, LEFT, $1, OPP_GENTLEMAN, $1
	object SPRITE_GENTLEMAN, $b, $4, STAY, UP, $2, OPP_GENTLEMAN, $2
	object SPRITE_BUG_CATCHER, $b, $e, STAY, UP, $3, OPP_YOUNGSTER, $8
	object SPRITE_LASS, $d, $b, STAY, LEFT, $4, OPP_LASS, $b
	object SPRITE_GIRL, $16, $3, WALK, $1, $5 ; person
	object SPRITE_FAT_BALD_GUY, $0, $e, STAY, NONE, $6 ; person
	object SPRITE_LITTLE_GIRL, $2, $b, STAY, DOWN, $7 ; person
	object SPRITE_CLEFAIRY, $3, $b, STAY, DOWN, $8 ; person
	object SPRITE_GIRL, $a, $d, STAY, RIGHT, $9 ; person
	object SPRITE_BALL, $c, $f, STAY, NONE, $a, TM_08
	object SPRITE_GENTLEMAN, $15, $d, WALK, $2, $b ; person

	; warp-to
	warp_to $0, $0, SS_ANNE_8_WIDTH ; SS_ANNE_1
	warp_to $a, $0, SS_ANNE_8_WIDTH ; SS_ANNE_1
	warp_to $14, $0, SS_ANNE_8_WIDTH ; SS_ANNE_1
	warp_to $0, $a, SS_ANNE_8_WIDTH ; SS_ANNE_1
	warp_to $a, $a, SS_ANNE_8_WIDTH ; SS_ANNE_1
	warp_to $14, $a, SS_ANNE_8_WIDTH ; SS_ANNE_1
