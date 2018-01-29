Route5Object:
	db 10 ; border block

	db 5 ; warps
	warp 10, 29, 3, ROUTE_5_GATE
	warp 9, 29, 2, ROUTE_5_GATE
	warp 10, 33, 0, ROUTE_5_GATE
	warp 17, 27, 0, PATH_ENTRANCE_ROUTE_5
	warp 10, 21, 0, DAYCAREM

	db 1 ; signs
	sign 17, 29, 1 ; Route5Text1

	db 0 ; objects

	; warp-to
	warp_to 10, 29, ROUTE_5_WIDTH ; ROUTE_5_GATE
	warp_to 9, 29, ROUTE_5_WIDTH ; ROUTE_5_GATE
	warp_to 10, 33, ROUTE_5_WIDTH ; ROUTE_5_GATE
	warp_to 17, 27, ROUTE_5_WIDTH ; PATH_ENTRANCE_ROUTE_5
	warp_to 10, 21, ROUTE_5_WIDTH ; DAYCAREM
