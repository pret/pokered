Route5Object:
	db $a ; border block

	db $5 ; warps
	warp $a, $1d, $3, ROUTE_5_GATE
	warp $9, $1d, $2, ROUTE_5_GATE
	warp $a, $21, $0, ROUTE_5_GATE
	warp $11, $1b, $0, PATH_ENTRANCE_ROUTE_5
	warp $a, $15, $0, DAYCAREM

	db $1 ; signs
	sign $11, $1d, $1 ; Route5Text1

	db $0 ; objects

	; warp-to
	warp_to $a, $1d, ROUTE_5_WIDTH ; ROUTE_5_GATE
	warp_to $9, $1d, ROUTE_5_WIDTH ; ROUTE_5_GATE
	warp_to $a, $21, ROUTE_5_WIDTH ; ROUTE_5_GATE
	warp_to $11, $1b, ROUTE_5_WIDTH ; PATH_ENTRANCE_ROUTE_5
	warp_to $a, $15, ROUTE_5_WIDTH ; DAYCAREM
