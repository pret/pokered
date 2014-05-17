UndergroundPathEntranceRoute7CopyObject: ; 5d787 (17:5787)
	db $a ; border block

	db $3 ; warps
	db $7, $3, $5, $ff
	db $7, $4, $5, $ff
	db $4, $4, $0, UNDERGROUND_PATH_WE

	db $0 ; signs

	db $2 ; people
	db SPRITE_GIRL, $2 + 4, $3 + 4, $ff, $ff, $1 ; person
	db SPRITE_FAT_BALD_GUY, $4 + 4, $2 + 4, $ff, $ff, $2 ; person

	; warp-to
	EVENT_DISP PATH_ENTRANCE_ROUTE_7_COPY_WIDTH, $7, $3
	EVENT_DISP PATH_ENTRANCE_ROUTE_7_COPY_WIDTH, $7, $4
	EVENT_DISP PATH_ENTRANCE_ROUTE_7_COPY_WIDTH, $4, $4 ; UNDERGROUND_PATH_WE
