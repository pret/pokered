SSAnne4Object:
	db $c ; border block

	db $6 ; warps
	warp $17, $3, $8, SS_ANNE_10
	warp $13, $3, $6, SS_ANNE_10
	warp $f, $3, $4, SS_ANNE_10
	warp $b, $3, $2, SS_ANNE_10
	warp $7, $3, $0, SS_ANNE_10
	warp $1b, $5, $9, SS_ANNE_1

	db $0 ; signs

	db $0 ; objects

	; warp-to
	warp_to $17, $3, SS_ANNE_4_WIDTH ; SS_ANNE_10
	warp_to $13, $3, SS_ANNE_4_WIDTH ; SS_ANNE_10
	warp_to $f, $3, SS_ANNE_4_WIDTH ; SS_ANNE_10
	warp_to $b, $3, SS_ANNE_4_WIDTH ; SS_ANNE_10
	warp_to $7, $3, SS_ANNE_4_WIDTH ; SS_ANNE_10
	warp_to $1b, $5, SS_ANNE_4_WIDTH ; SS_ANNE_1
