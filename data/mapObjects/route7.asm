Route7Object:
	db $f ; border block

	db $5 ; warps
	warp $12, $9, $2, ROUTE_7_GATE
	warp $12, $a, $3, ROUTE_7_GATE
	warp $b, $9, $0, ROUTE_7_GATE
	warp $b, $a, $1, ROUTE_7_GATE
	warp $5, $d, $0, PATH_ENTRANCE_ROUTE_7

	db $1 ; signs
	sign $3, $d, $1 ; Route7Text1

	db $0 ; objects

	; warp-to
	warp_to $12, $9, ROUTE_7_WIDTH ; ROUTE_7_GATE
	warp_to $12, $a, ROUTE_7_WIDTH ; ROUTE_7_GATE
	warp_to $b, $9, ROUTE_7_WIDTH ; ROUTE_7_GATE
	warp_to $b, $a, ROUTE_7_WIDTH ; ROUTE_7_GATE
	warp_to $5, $d, ROUTE_7_WIDTH ; PATH_ENTRANCE_ROUTE_7
