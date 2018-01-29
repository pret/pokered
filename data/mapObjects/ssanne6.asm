SSAnne6Object:
	db $c ; border block

	db $1 ; warps
	warp $6, $0, $a, SS_ANNE_1

	db $0 ; signs

	db $7 ; objects
	object SPRITE_COOK, $1, $8, WALK, $1, $1 ; person
	object SPRITE_COOK, $5, $8, WALK, $1, $2 ; person
	object SPRITE_COOK, $9, $7, WALK, $1, $3 ; person
	object SPRITE_COOK, $d, $6, STAY, NONE, $4 ; person
	object SPRITE_COOK, $d, $8, STAY, NONE, $5 ; person
	object SPRITE_COOK, $d, $a, STAY, NONE, $6 ; person
	object SPRITE_COOK, $b, $d, STAY, UP, $7 ; person

	; warp-to
	warp_to $6, $0, SS_ANNE_6_WIDTH ; SS_ANNE_1
