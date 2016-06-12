SSAnne9Object:
	db $c ; border block

	db $c ; warps
	db $5, $2, $0, SS_ANNE_2
	db $5, $3, $0, SS_ANNE_2
	db $5, $c, $1, SS_ANNE_2
	db $5, $d, $1, SS_ANNE_2
	db $5, $16, $2, SS_ANNE_2
	db $5, $17, $2, SS_ANNE_2
	db $f, $2, $3, SS_ANNE_2
	db $f, $3, $3, SS_ANNE_2
	db $f, $c, $4, SS_ANNE_2
	db $f, $d, $4, SS_ANNE_2
	db $f, $16, $5, SS_ANNE_2
	db $f, $17, $5, SS_ANNE_2

	db $0 ; signs

	db $d ; objects
	object SPRITE_GENTLEMAN, $a, $2, STAY, RIGHT, $1, OPP_GENTLEMAN, $3
	object SPRITE_FISHER2, $d, $4, STAY, LEFT, $2, OPP_FISHER, $1
	object SPRITE_GENTLEMAN, $0, $e, STAY, RIGHT, $3, OPP_GENTLEMAN, $5
	object SPRITE_LASS, $2, $b, STAY, DOWN, $4, OPP_LASS, $c
	object SPRITE_GENTLEMAN, $1, $2, STAY, DOWN, $5 ; person
	object SPRITE_BALL, $c, $1, STAY, NONE, $6, MAX_ETHER
	object SPRITE_GENTLEMAN, $15, $2, STAY, DOWN, $7 ; person
	object SPRITE_OLD_PERSON, $16, $1, STAY, DOWN, $8 ; person
	object SPRITE_BALL, $0, $c, STAY, NONE, $9, RARE_CANDY
	object SPRITE_GENTLEMAN, $c, $c, STAY, DOWN, $a ; person
	object SPRITE_YOUNG_BOY, $b, $e, STAY, NONE, $b ; person
	object SPRITE_BRUNETTE_GIRL, $16, $c, STAY, LEFT, $c ; person
	object SPRITE_FOULARD_WOMAN, $14, $c, STAY, RIGHT, $d ; person

	; warp-to
	EVENT_DISP SS_ANNE_9_WIDTH, $5, $2 ; SS_ANNE_2
	EVENT_DISP SS_ANNE_9_WIDTH, $5, $3 ; SS_ANNE_2
	EVENT_DISP SS_ANNE_9_WIDTH, $5, $c ; SS_ANNE_2
	EVENT_DISP SS_ANNE_9_WIDTH, $5, $d ; SS_ANNE_2
	EVENT_DISP SS_ANNE_9_WIDTH, $5, $16 ; SS_ANNE_2
	EVENT_DISP SS_ANNE_9_WIDTH, $5, $17 ; SS_ANNE_2
	EVENT_DISP SS_ANNE_9_WIDTH, $f, $2 ; SS_ANNE_2
	EVENT_DISP SS_ANNE_9_WIDTH, $f, $3 ; SS_ANNE_2
	EVENT_DISP SS_ANNE_9_WIDTH, $f, $c ; SS_ANNE_2
	EVENT_DISP SS_ANNE_9_WIDTH, $f, $d ; SS_ANNE_2
	EVENT_DISP SS_ANNE_9_WIDTH, $f, $16 ; SS_ANNE_2
	EVENT_DISP SS_ANNE_9_WIDTH, $f, $17 ; SS_ANNE_2
