UndergroundPathNSObject: ; 0x61f2a (size=20)
	db $1 ; border tile

	db $2 ; warps
	db $4, $5, $2, PATH_ENTRANCE_ROUTE_5
	db $29, $2, $2, PATH_ENTRANCE_ROUTE_6

	db $0 ; signs

	db $0 ; people

	; warp-to
	EVENT_DISP $4, $4, $5 ; PATH_ENTRANCE_ROUTE_5
	EVENT_DISP $4, $29, $2 ; PATH_ENTRANCE_ROUTE_6
