Route2HouseObject:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $2, $ff
	db $7, $3, $2, $ff

	db $0 ; signs

	db $2 ; objects
	object SPRITE_OAK_AIDE, $2, $4, STAY, RIGHT, $1 ; person
	object SPRITE_GAMEBOY_KID_COPY, $4, $1, STAY, DOWN, $2 ; person

	; warp-to
	EVENT_DISP ROUTE_2_HOUSE_WIDTH, $7, $2
	EVENT_DISP ROUTE_2_HOUSE_WIDTH, $7, $3
