Route18GateUpstairsObject: ; 0x499a4 (size=24)
	db $a ; border block

	db $1 ; warps
	db $7, $7, $4, ROUTE_18_GATE_1F

	db $2 ; signs
	db $2, $1, $2 ; Route18GateUpstairsText2
	db $2, $6, $3 ; Route18GateUpstairsText3

	db $1 ; objects
	object SPRITE_BUG_CATCHER, $4, $2, WALK, $2, $1 ; person

	; warp-to
	EVENT_DISP ROUTE_18_GATE_2F_WIDTH, $7, $7 ; ROUTE_18_GATE_1F
