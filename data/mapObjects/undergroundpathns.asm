UndergroundPathNSObject:
	db $1 ; border block

	db $2 ; warps
	db $4, $5, $2, PATH_ENTRANCE_ROUTE_5
	db $29, $2, $2, PATH_ENTRANCE_ROUTE_6

	db $0 ; signs

	db $0 ; objects

	; warp-to
	EVENT_DISP UNDERGROUND_PATH_NS_WIDTH, $4, $5 ; PATH_ENTRANCE_ROUTE_5
	EVENT_DISP UNDERGROUND_PATH_NS_WIDTH, $29, $2 ; PATH_ENTRANCE_ROUTE_6
