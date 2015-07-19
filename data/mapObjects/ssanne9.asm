SSAnne9Object: ; 0x61c8d (size=188)
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
	object SPRITE_GENTLEMAN, $a, $2, FACE, LEFT, $1, GENTLEMAN + $C8, $3
	object SPRITE_FISHER2, $d, $4, FACE, RIGHT, $2, FISHER + $C8, $1
	object SPRITE_GENTLEMAN, $0, $e, FACE, LEFT, $3, GENTLEMAN + $C8, $5
	object SPRITE_LASS, $2, $b, FACE, DOWN, $4, LASS + $C8, $c
	object SPRITE_GENTLEMAN, $1, $2, FACE, DOWN, $5 ; person
	object SPRITE_BALL, $c, $1, FACE, STAY, $6, MAX_ETHER
	object SPRITE_GENTLEMAN, $15, $2, FACE, DOWN, $7 ; person
	object SPRITE_OLD_PERSON, $16, $1, FACE, DOWN, $8 ; person
	object SPRITE_BALL, $0, $c, FACE, STAY, $9, RARE_CANDY
	object SPRITE_GENTLEMAN, $c, $c, FACE, DOWN, $a ; person
	object SPRITE_YOUNG_BOY, $b, $e, FACE, STAY, $b ; person
	object SPRITE_BRUNETTE_GIRL, $16, $c, FACE, RIGHT, $c ; person
	object SPRITE_FOULARD_WOMAN, $14, $c, FACE, LEFT, $d ; person

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
