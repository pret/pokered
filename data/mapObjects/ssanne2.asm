SSAnne2Object:
	db $c ; border block

	db $9 ; warps
	warp $9, $b, $0, SS_ANNE_9
	warp $d, $b, $2, SS_ANNE_9
	warp $11, $b, $4, SS_ANNE_9
	warp $15, $b, $6, SS_ANNE_9
	warp $19, $b, $8, SS_ANNE_9
	warp $1d, $b, $a, SS_ANNE_9
	warp $2, $4, $8, SS_ANNE_1
	warp $2, $c, $1, SS_ANNE_3
	warp $24, $4, $0, SS_ANNE_7

	db $0 ; signs

	db $2 ; objects
	object SPRITE_WAITER, $3, $7, WALK, $1, $1 ; person
	object SPRITE_BLUE, $24, $4, STAY, DOWN, $2, OPP_SONY1, $1

	; warp-to
	warp_to $9, $b, SS_ANNE_2_WIDTH ; SS_ANNE_9
	warp_to $d, $b, SS_ANNE_2_WIDTH ; SS_ANNE_9
	warp_to $11, $b, SS_ANNE_2_WIDTH ; SS_ANNE_9
	warp_to $15, $b, SS_ANNE_2_WIDTH ; SS_ANNE_9
	warp_to $19, $b, SS_ANNE_2_WIDTH ; SS_ANNE_9
	warp_to $1d, $b, SS_ANNE_2_WIDTH ; SS_ANNE_9
	warp_to $2, $4, SS_ANNE_2_WIDTH ; SS_ANNE_1
	warp_to $2, $c, SS_ANNE_2_WIDTH ; SS_ANNE_3
	warp_to $24, $4, SS_ANNE_2_WIDTH ; SS_ANNE_7
