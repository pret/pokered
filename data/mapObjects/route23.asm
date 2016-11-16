Route23Object:
	db $f ; border block

	db $4 ; warps
	db $8b, $7, $2, ROUTE_22_GATE
	db $8b, $8, $3, ROUTE_22_GATE
	db $1f, $4, $0, VICTORY_ROAD_1
	db $1f, $e, $1, VICTORY_ROAD_2

	db $1 ; signs
	db $21, $3, $8 ; Route23Text8

	db $7 ; objects
	object SPRITE_GUARD, $4, $23, STAY, DOWN, $1 ; person
	object SPRITE_GUARD, $a, $38, STAY, DOWN, $2 ; person
	object SPRITE_SWIMMER, $8, $55, STAY, DOWN, $3 ; person
	object SPRITE_SWIMMER, $b, $60, STAY, DOWN, $4 ; person
	object SPRITE_GUARD, $c, $69, STAY, DOWN, $5 ; person
	object SPRITE_GUARD, $8, $77, STAY, DOWN, $6 ; person
	object SPRITE_GUARD, $8, $88, STAY, DOWN, $7 ; person

	; warp-to
	EVENT_DISP ROUTE_23_WIDTH, $8b, $7 ; ROUTE_22_GATE
	EVENT_DISP ROUTE_23_WIDTH, $8b, $8 ; ROUTE_22_GATE
	EVENT_DISP ROUTE_23_WIDTH, $1f, $4 ; VICTORY_ROAD_1
	EVENT_DISP ROUTE_23_WIDTH, $1f, $e ; VICTORY_ROAD_2
