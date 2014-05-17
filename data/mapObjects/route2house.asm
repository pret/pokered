Route2HouseObject: ; 0x1df07 (size=32)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $2, $ff
	db $7, $3, $2, $ff

	db $0 ; signs

	db $2 ; people
	db SPRITE_OAK_AIDE, $4 + 4, $2 + 4, $ff, $d3, $1 ; person
	db SPRITE_GAMEBOY_KID_COPY, $1 + 4, $4 + 4, $ff, $d0, $2 ; person

	; warp-to
	EVENT_DISP ROUTE_2_HOUSE_WIDTH, $7, $2
	EVENT_DISP ROUTE_2_HOUSE_WIDTH, $7, $3
