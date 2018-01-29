CeladonMart1Object:
	db $f ; border block

	db $6 ; warps
	warp $2, $7, $0, $ff
	warp $3, $7, $0, $ff
	warp $10, $7, $1, $ff
	warp $11, $7, $1, $ff
	warp $c, $1, $0, CELADON_MART_2
	warp $1, $1, $0, CELADON_MART_ELEVATOR

	db $2 ; signs
	sign $b, $4, $2 ; CeladonMart1Text2
	sign $e, $1, $3 ; CeladonMart1Text3

	db $1 ; objects
	object SPRITE_CABLE_CLUB_WOMAN, $8, $3, STAY, DOWN, $1 ; person

	; warp-to
	warp_to $2, $7, CELADON_MART_1_WIDTH
	warp_to $3, $7, CELADON_MART_1_WIDTH
	warp_to $10, $7, CELADON_MART_1_WIDTH
	warp_to $11, $7, CELADON_MART_1_WIDTH
	warp_to $c, $1, CELADON_MART_1_WIDTH ; CELADON_MART_2
	warp_to $1, $1, CELADON_MART_1_WIDTH ; CELADON_MART_ELEVATOR
