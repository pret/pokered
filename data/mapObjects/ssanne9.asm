SSAnne9Object:
	db $c ; border block

	db $c ; warps
	warp $2, $5, $0, SS_ANNE_2
	warp $3, $5, $0, SS_ANNE_2
	warp $c, $5, $1, SS_ANNE_2
	warp $d, $5, $1, SS_ANNE_2
	warp $16, $5, $2, SS_ANNE_2
	warp $17, $5, $2, SS_ANNE_2
	warp $2, $f, $3, SS_ANNE_2
	warp $3, $f, $3, SS_ANNE_2
	warp $c, $f, $4, SS_ANNE_2
	warp $d, $f, $4, SS_ANNE_2
	warp $16, $f, $5, SS_ANNE_2
	warp $17, $f, $5, SS_ANNE_2

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
	warp_to $2, $5, SS_ANNE_9_WIDTH ; SS_ANNE_2
	warp_to $3, $5, SS_ANNE_9_WIDTH ; SS_ANNE_2
	warp_to $c, $5, SS_ANNE_9_WIDTH ; SS_ANNE_2
	warp_to $d, $5, SS_ANNE_9_WIDTH ; SS_ANNE_2
	warp_to $16, $5, SS_ANNE_9_WIDTH ; SS_ANNE_2
	warp_to $17, $5, SS_ANNE_9_WIDTH ; SS_ANNE_2
	warp_to $2, $f, SS_ANNE_9_WIDTH ; SS_ANNE_2
	warp_to $3, $f, SS_ANNE_9_WIDTH ; SS_ANNE_2
	warp_to $c, $f, SS_ANNE_9_WIDTH ; SS_ANNE_2
	warp_to $d, $f, SS_ANNE_9_WIDTH ; SS_ANNE_2
	warp_to $16, $f, SS_ANNE_9_WIDTH ; SS_ANNE_2
	warp_to $17, $f, SS_ANNE_9_WIDTH ; SS_ANNE_2
