Route16HouseObject:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $8, $ff
	db $7, $3, $8, $ff

	db $0 ; signs

	db $2 ; objects
	object SPRITE_BRUNETTE_GIRL, $2, $3, STAY, RIGHT, $1 ; person
	object SPRITE_BIRD, $6, $4, WALK, $0, $2 ; person

	; warp-to
	EVENT_DISP ROUTE_16_HOUSE_WIDTH, $7, $2
	EVENT_DISP ROUTE_16_HOUSE_WIDTH, $7, $3
