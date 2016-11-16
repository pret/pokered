UndergroundPathWEObject:
	db $1 ; border block

	db $2 ; warps
	db $5, $2, $2, PATH_ENTRANCE_ROUTE_7
	db $2, $2f, $2, PATH_ENTRANCE_ROUTE_8

	db $0 ; signs

	db $0 ; objects

	; warp-to
	EVENT_DISP UNDERGROUND_PATH_WE_WIDTH, $5, $2 ; PATH_ENTRANCE_ROUTE_7
	EVENT_DISP UNDERGROUND_PATH_WE_WIDTH, $2, $2f ; PATH_ENTRANCE_ROUTE_8
