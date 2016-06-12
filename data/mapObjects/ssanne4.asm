SSAnne4Object:
	db $c ; border block

	db $6 ; warps
	db $3, $17, $8, SS_ANNE_10
	db $3, $13, $6, SS_ANNE_10
	db $3, $f, $4, SS_ANNE_10
	db $3, $b, $2, SS_ANNE_10
	db $3, $7, $0, SS_ANNE_10
	db $5, $1b, $9, SS_ANNE_1

	db $0 ; signs

	db $0 ; objects

	; warp-to
	EVENT_DISP SS_ANNE_4_WIDTH, $3, $17 ; SS_ANNE_10
	EVENT_DISP SS_ANNE_4_WIDTH, $3, $13 ; SS_ANNE_10
	EVENT_DISP SS_ANNE_4_WIDTH, $3, $f ; SS_ANNE_10
	EVENT_DISP SS_ANNE_4_WIDTH, $3, $b ; SS_ANNE_10
	EVENT_DISP SS_ANNE_4_WIDTH, $3, $7 ; SS_ANNE_10
	EVENT_DISP SS_ANNE_4_WIDTH, $5, $1b ; SS_ANNE_1
