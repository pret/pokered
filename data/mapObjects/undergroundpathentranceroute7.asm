UndergroundPathEntranceRoute7Object:
	db $a ; border block

	db $3 ; warps
	db $7, $3, $4, $ff
	db $7, $4, $4, $ff
	db $4, $4, $0, UNDERGROUND_PATH_WE

	db $0 ; signs

	db $1 ; objects
	object SPRITE_FAT_BALD_GUY, $2, $4, STAY, NONE, $1 ; person

	; warp-to
	EVENT_DISP PATH_ENTRANCE_ROUTE_7_WIDTH, $7, $3
	EVENT_DISP PATH_ENTRANCE_ROUTE_7_WIDTH, $7, $4
	EVENT_DISP PATH_ENTRANCE_ROUTE_7_WIDTH, $4, $4 ; UNDERGROUND_PATH_WE
