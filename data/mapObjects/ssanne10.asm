SSAnne10Object:
	db $c ; border block

	db $a ; warps
	db $5, $2, $4, SS_ANNE_4
	db $5, $3, $4, SS_ANNE_4
	db $5, $c, $3, SS_ANNE_4
	db $5, $d, $3, SS_ANNE_4
	db $5, $16, $2, SS_ANNE_4
	db $5, $17, $2, SS_ANNE_4
	db $f, $2, $1, SS_ANNE_4
	db $f, $3, $1, SS_ANNE_4
	db $f, $c, $0, SS_ANNE_4
	db $f, $d, $0, SS_ANNE_4

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
	EVENT_DISP SS_ANNE_10_WIDTH, $5, $2 ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $5, $3 ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $5, $c ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $5, $d ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $5, $16 ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $5, $17 ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $f, $2 ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $f, $3 ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $f, $c ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $f, $d ; SS_ANNE_4
