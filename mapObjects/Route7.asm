Route7Object: ; 0x48022 (size=47)
	db $f ; border tile

	db $5 ; warps
	db $9, $12, $2, ROUTE_7_GATE
	db $a, $12, $3, ROUTE_7_GATE
	db $9, $b, $0, ROUTE_7_GATE
	db $a, $b, $1, ROUTE_7_GATE
	db $d, $5, $0, PATH_ENTRANCE_ROUTE_7

	db $1 ; signs
	db $d, $3, $1 ; Route7Text1

	db $0 ; people

	; warp-to
	EVENT_DISP $a, $9, $12 ; ROUTE_7_GATE
	EVENT_DISP $a, $a, $12 ; ROUTE_7_GATE
	EVENT_DISP $a, $9, $b ; ROUTE_7_GATE
	EVENT_DISP $a, $a, $b ; ROUTE_7_GATE
	EVENT_DISP $a, $d, $5 ; PATH_ENTRANCE_ROUTE_7