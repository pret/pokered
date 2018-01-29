CeladonMart4Object:
	db $f ; border block

	db $3 ; warps
	warp $c, $1, $0, CELADON_MART_3
	warp $10, $1, $1, CELADON_MART_5
	warp $1, $1, $0, CELADON_MART_ELEVATOR

	db $1 ; signs
	sign $e, $1, $4 ; CeladonMart4Text4

	db $3 ; objects
	object SPRITE_MART_GUY, $5, $7, STAY, NONE, $1 ; person
	object SPRITE_BLACK_HAIR_BOY_2, $f, $5, WALK, $2, $2 ; person
	object SPRITE_BUG_CATCHER, $5, $2, WALK, $2, $3 ; person

	; warp-to
	warp_to $c, $1, CELADON_MART_4_WIDTH ; CELADON_MART_3
	warp_to $10, $1, CELADON_MART_4_WIDTH ; CELADON_MART_5
	warp_to $1, $1, CELADON_MART_4_WIDTH ; CELADON_MART_ELEVATOR
