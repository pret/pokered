Route18GateUpstairsObject: ; 0x499a4 (size=24)
	db $a ; border tile

	db $1 ; warps
	db $7, $7, $4, ROUTE_18_GATE_1F

	db $2 ; signs
	db $2, $1, $2 ; Route18GateUpstairsText2
	db $2, $6, $3 ; Route18GateUpstairsText3

	db $1 ; people
	db SPRITE_BUG_CATCHER, $2 + 4, $4 + 4, $fe, $2, $1 ; person

	; warp-to
	EVENT_DISP $4, $7, $7 ; ROUTE_18_GATE_1F
