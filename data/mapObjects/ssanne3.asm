SSAnne3Object: ; 0x4493c (size=26)
	db $c ; border block

	db $2 ; warps
	db $3, $0, $0, SS_ANNE_5
	db $3, $13, $7, SS_ANNE_2

	db $0 ; signs

	db $1 ; people
	db SPRITE_SAILOR, $3 + 4, $9 + 4, $fe, $2, $1 ; person

	; warp-to
	EVENT_DISP SS_ANNE_3_WIDTH, $3, $0 ; SS_ANNE_5
	EVENT_DISP SS_ANNE_3_WIDTH, $3, $13 ; SS_ANNE_2
