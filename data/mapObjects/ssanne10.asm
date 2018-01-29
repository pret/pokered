SSAnne10Object:
	db $c ; border block

	db $a ; warps
	warp $2, $5, $4, SS_ANNE_4
	warp $3, $5, $4, SS_ANNE_4
	warp $c, $5, $3, SS_ANNE_4
	warp $d, $5, $3, SS_ANNE_4
	warp $16, $5, $2, SS_ANNE_4
	warp $17, $5, $2, SS_ANNE_4
	warp $2, $f, $1, SS_ANNE_4
	warp $3, $f, $1, SS_ANNE_4
	warp $c, $f, $0, SS_ANNE_4
	warp $d, $f, $0, SS_ANNE_4

	db $0 ; signs

	db $b ; objects
	object SPRITE_SAILOR, $0, $d, STAY, DOWN, $1, OPP_SAILOR, $3
	object SPRITE_SAILOR, $2, $b, STAY, DOWN, $2, OPP_SAILOR, $4
	object SPRITE_SAILOR, $c, $3, STAY, LEFT, $3, OPP_SAILOR, $5
	object SPRITE_SAILOR, $16, $2, STAY, DOWN, $4, OPP_SAILOR, $6
	object SPRITE_SAILOR, $0, $2, STAY, RIGHT, $5, OPP_SAILOR, $7
	object SPRITE_FISHER2, $0, $4, STAY, RIGHT, $6, OPP_FISHER, $2
	object SPRITE_BLACK_HAIR_BOY_2, $a, $d, STAY, RIGHT, $7 ; person
	object SPRITE_SLOWBRO, $b, $c, STAY, NONE, $8 ; person
	object SPRITE_BALL, $14, $2, STAY, NONE, $9, ETHER
	object SPRITE_BALL, $a, $2, STAY, NONE, $a, TM_44
	object SPRITE_BALL, $c, $b, STAY, NONE, $b, MAX_POTION

	; warp-to
	warp_to $2, $5, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to $3, $5, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to $c, $5, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to $d, $5, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to $16, $5, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to $17, $5, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to $2, $f, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to $3, $f, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to $c, $f, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to $d, $f, SS_ANNE_10_WIDTH ; SS_ANNE_4
