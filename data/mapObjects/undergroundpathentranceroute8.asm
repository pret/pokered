UndergroundPathEntranceRoute8Object:
	db $a ; border block

	db $3 ; warps
	db $7, $3, $4, $ff
	db $7, $4, $4, $ff
	db $4, $4, $1, UNDERGROUND_PATH_WE

	db $0 ; signs

	db $1 ; objects
	object SPRITE_GIRL, $3, $4, STAY, NONE, $1 ; person

	; warp-to
	EVENT_DISP PATH_ENTRANCE_ROUTE_8_WIDTH, $7, $3
	EVENT_DISP PATH_ENTRANCE_ROUTE_8_WIDTH, $7, $4
	EVENT_DISP PATH_ENTRANCE_ROUTE_8_WIDTH, $4, $4 ; UNDERGROUND_PATH_WE
