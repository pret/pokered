VermilionHouse2Object:
	db $a ; border block

	db $2 ; warps
	warp $2, $7, $8, $ff
	warp $3, $7, $8, $ff

	db $0 ; signs

	db $1 ; objects
	object SPRITE_FISHER, $2, $4, STAY, RIGHT, $1 ; person

	; warp-to
	warp_to $2, $7, VERMILION_HOUSE_2_WIDTH
	warp_to $3, $7, VERMILION_HOUSE_2_WIDTH
