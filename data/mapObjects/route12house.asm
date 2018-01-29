Route12HouseObject:
	db $a ; border block

	db $2 ; warps
	warp $2, $7, $3, $ff
	warp $3, $7, $3, $ff

	db $0 ; signs

	db $1 ; objects
	object SPRITE_FISHER, $2, $4, STAY, RIGHT, $1 ; person

	; warp-to
	warp_to $2, $7, ROUTE_12_HOUSE_WIDTH
	warp_to $3, $7, ROUTE_12_HOUSE_WIDTH
