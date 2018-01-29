CeladonMart5Object:
	db $f ; border block

	db $3 ; warps
	warp $c, $1, $0, CELADON_MART_ROOF
	warp $10, $1, $1, CELADON_MART_4
	warp $1, $1, $0, CELADON_MART_ELEVATOR

	db $1 ; signs
	sign $e, $1, $5 ; CeladonMart5Text5

	db $4 ; objects
	object SPRITE_GENTLEMAN, $e, $5, WALK, $1, $1 ; person
	object SPRITE_SAILOR, $2, $6, STAY, NONE, $2 ; person
	object SPRITE_MART_GUY, $5, $3, STAY, DOWN, $3 ; person
	object SPRITE_MART_GUY, $6, $3, STAY, DOWN, $4 ; person

	; warp-to
	warp_to $c, $1, CELADON_MART_5_WIDTH ; CELADON_MART_ROOF
	warp_to $10, $1, CELADON_MART_5_WIDTH ; CELADON_MART_4
	warp_to $1, $1, CELADON_MART_5_WIDTH ; CELADON_MART_ELEVATOR
