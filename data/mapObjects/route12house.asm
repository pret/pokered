Route12HouseObject:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $3, $ff
	db $7, $3, $3, $ff

	db $0 ; signs

	db $1 ; objects
	object SPRITE_FISHER, $2, $4, STAY, RIGHT, $1 ; person

	; warp-to
	EVENT_DISP ROUTE_12_HOUSE_WIDTH, $7, $2
	EVENT_DISP ROUTE_12_HOUSE_WIDTH, $7, $3
