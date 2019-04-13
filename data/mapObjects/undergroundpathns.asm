UndergroundPathNSObject:
	db $1 ; border block

	db 2 ; warps
	warp 5, 4, 2, PATH_ENTRANCE_ROUTE_5
	warp 2, 41, 2, PATH_ENTRANCE_ROUTE_6

	db 0 ; signs

	db 0 ; objects

	; warp-to
	warp_to 5, 4, UNDERGROUND_PATH_NS_WIDTH ; PATH_ENTRANCE_ROUTE_5
	warp_to 2, 41, UNDERGROUND_PATH_NS_WIDTH ; PATH_ENTRANCE_ROUTE_6
