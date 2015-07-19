SSAnne5Object: ; 0x6172b (size=54)
	db $23 ; border block

	db $2 ; warps
	db $6, $d, $0, SS_ANNE_3
	db $7, $d, $0, SS_ANNE_3

	db $0 ; signs

	db $5 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $5, $2, STAY, UP, $1 ; person
	object SPRITE_SAILOR, $4, $9, STAY, NONE, $2 ; person
	object SPRITE_BLACK_HAIR_BOY_1, $7, $b, STAY, NONE, $3 ; person
	object SPRITE_SAILOR, $4, $4, STAY, DOWN, $4, SAILOR + $C8, $1
	object SPRITE_SAILOR, $a, $8, STAY, UP, $5, SAILOR + $C8, $2

	; warp-to
	EVENT_DISP SS_ANNE_5_WIDTH, $6, $d ; SS_ANNE_3
	EVENT_DISP SS_ANNE_5_WIDTH, $7, $d ; SS_ANNE_3
