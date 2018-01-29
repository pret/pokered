SSAnne1Object:
	db $c ; border block

	db $b ; warps
	warp $1a, $0, $1, VERMILION_DOCK
	warp $1b, $0, $1, VERMILION_DOCK
	warp $1f, $8, $0, SS_ANNE_8
	warp $17, $8, $1, SS_ANNE_8
	warp $13, $8, $2, SS_ANNE_8
	warp $f, $8, $3, SS_ANNE_8
	warp $b, $8, $4, SS_ANNE_8
	warp $7, $8, $5, SS_ANNE_8
	warp $2, $6, $6, SS_ANNE_2
	warp $25, $f, $5, SS_ANNE_4
	warp $3, $10, $0, SS_ANNE_6

	db $0 ; signs

	db $2 ; objects
	object SPRITE_WAITER, $c, $6, WALK, $2, $1 ; person
	object SPRITE_SAILOR, $1b, $5, STAY, NONE, $2 ; person

	; warp-to
	warp_to $1a, $0, SS_ANNE_1_WIDTH ; VERMILION_DOCK
	warp_to $1b, $0, SS_ANNE_1_WIDTH ; VERMILION_DOCK
	warp_to $1f, $8, SS_ANNE_1_WIDTH ; SS_ANNE_8
	warp_to $17, $8, SS_ANNE_1_WIDTH ; SS_ANNE_8
	warp_to $13, $8, SS_ANNE_1_WIDTH ; SS_ANNE_8
	warp_to $f, $8, SS_ANNE_1_WIDTH ; SS_ANNE_8
	warp_to $b, $8, SS_ANNE_1_WIDTH ; SS_ANNE_8
	warp_to $7, $8, SS_ANNE_1_WIDTH ; SS_ANNE_8
	warp_to $2, $6, SS_ANNE_1_WIDTH ; SS_ANNE_2
	warp_to $25, $f, SS_ANNE_1_WIDTH ; SS_ANNE_4
	warp_to $3, $10, SS_ANNE_1_WIDTH ; SS_ANNE_6
