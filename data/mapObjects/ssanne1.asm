SSAnne1Object:
	db $c ; border block

	db $b ; warps
	db $0, $1a, $1, VERMILION_DOCK
	db $0, $1b, $1, VERMILION_DOCK
	db $8, $1f, $0, SS_ANNE_8
	db $8, $17, $1, SS_ANNE_8
	db $8, $13, $2, SS_ANNE_8
	db $8, $f, $3, SS_ANNE_8
	db $8, $b, $4, SS_ANNE_8
	db $8, $7, $5, SS_ANNE_8
	db $6, $2, $6, SS_ANNE_2
	db $f, $25, $5, SS_ANNE_4
	db $10, $3, $0, SS_ANNE_6

	db $0 ; signs

	db $2 ; objects
	object SPRITE_WAITER, $c, $6, WALK, $2, $1 ; person
	object SPRITE_SAILOR, $1b, $5, STAY, NONE, $2 ; person

	; warp-to
	EVENT_DISP SS_ANNE_1_WIDTH, $0, $1a ; VERMILION_DOCK
	EVENT_DISP SS_ANNE_1_WIDTH, $0, $1b ; VERMILION_DOCK
	EVENT_DISP SS_ANNE_1_WIDTH, $8, $1f ; SS_ANNE_8
	EVENT_DISP SS_ANNE_1_WIDTH, $8, $17 ; SS_ANNE_8
	EVENT_DISP SS_ANNE_1_WIDTH, $8, $13 ; SS_ANNE_8
	EVENT_DISP SS_ANNE_1_WIDTH, $8, $f ; SS_ANNE_8
	EVENT_DISP SS_ANNE_1_WIDTH, $8, $b ; SS_ANNE_8
	EVENT_DISP SS_ANNE_1_WIDTH, $8, $7 ; SS_ANNE_8
	EVENT_DISP SS_ANNE_1_WIDTH, $6, $2 ; SS_ANNE_2
	EVENT_DISP SS_ANNE_1_WIDTH, $f, $25 ; SS_ANNE_4
	EVENT_DISP SS_ANNE_1_WIDTH, $10, $3 ; SS_ANNE_6
