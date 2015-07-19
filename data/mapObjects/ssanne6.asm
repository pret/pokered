SSAnne6Object: ; 0x6181b (size=54)
	db $c ; border block

	db $1 ; warps
	db $0, $6, $a, SS_ANNE_1

	db $0 ; signs

	db $7 ; objects
	object SPRITE_COOK, $1, $8, WALK, $1, $1 ; person
	object SPRITE_COOK, $5, $8, WALK, $1, $2 ; person
	object SPRITE_COOK, $9, $7, WALK, $1, $3 ; person
	object SPRITE_COOK, $d, $6, FACE, STAY, $4 ; person
	object SPRITE_COOK, $d, $8, FACE, STAY, $5 ; person
	object SPRITE_COOK, $d, $a, FACE, STAY, $6 ; person
	object SPRITE_COOK, $b, $d, FACE, UP, $7 ; person

	; warp-to
	EVENT_DISP SS_ANNE_6_WIDTH, $0, $6 ; SS_ANNE_1
