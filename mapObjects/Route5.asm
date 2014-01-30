Route5Object: ; 0x545a3 (size=47)
	db $a ; border tile

	db $5 ; warps
	db $1d, $a, $3, ROUTE_5_GATE
	db $1d, $9, $2, ROUTE_5_GATE
	db $21, $a, $0, ROUTE_5_GATE
	db $1b, $11, $0, PATH_ENTRANCE_ROUTE_5
	db $15, $a, $0, DAYCAREM

	db $1 ; signs
	db $1d, $11, $1 ; Route5Text1

	db $0 ; people

	; warp-to
	EVENT_DISP $a, $1d, $a ; ROUTE_5_GATE
	EVENT_DISP $a, $1d, $9 ; ROUTE_5_GATE
	EVENT_DISP $a, $21, $a ; ROUTE_5_GATE
	EVENT_DISP $a, $1b, $11 ; PATH_ENTRANCE_ROUTE_5
	EVENT_DISP $a, $15, $a ; DAYCAREM
