SSAnne3Object:
	db $c ; border block

	db $2 ; warps
	db $3, $0, $0, SS_ANNE_5
	db $3, $13, $7, SS_ANNE_2

	db $0 ; signs

	db $1 ; objects
	object SPRITE_SAILOR, $9, $3, WALK, $2, $1 ; person

	; warp-to
	EVENT_DISP SS_ANNE_3_WIDTH, $3, $0 ; SS_ANNE_5
	EVENT_DISP SS_ANNE_3_WIDTH, $3, $13 ; SS_ANNE_2
