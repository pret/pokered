Route18GateObject: ; 0x49937 (size=50)
	db $a ; border tile

	db $5 ; warps
	db $4, $0, $0, $ff
	db $5, $0, $1, $ff
	db $4, $7, $2, $ff
	db $5, $7, $3, $ff
	db $8, $6, $0, ROUTE_18_GATE_2F

	db $0 ; signs

	db $1 ; people
	db SPRITE_GUARD, $1 + 4, $4 + 4, $ff, $d0, $1 ; person

	; warp-to
	EVENT_DISP $4, $4, $0
	EVENT_DISP $4, $5, $0
	EVENT_DISP $4, $4, $7
	EVENT_DISP $4, $5, $7
	EVENT_DISP $4, $8, $6 ; ROUTE_18_GATE_2F
