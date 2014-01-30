UndergroundPathWEObject: ; 0x61f4e (size=20)
	db $1 ; border tile

	db $2 ; warps
	db $5, $2, $2, PATH_ENTRANCE_ROUTE_7
	db $2, $2f, $2, PATH_ENTRANCE_ROUTE_8

	db $0 ; signs

	db $0 ; people

	; warp-to
	EVENT_DISP $19, $5, $2 ; PATH_ENTRANCE_ROUTE_7
	EVENT_DISP $19, $2, $2f ; PATH_ENTRANCE_ROUTE_8
