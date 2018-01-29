Route23Object:
	db $f ; border block

	db $4 ; warps
	warp $7, $8b, $2, ROUTE_22_GATE
	warp $8, $8b, $3, ROUTE_22_GATE
	warp $4, $1f, $0, VICTORY_ROAD_1
	warp $e, $1f, $1, VICTORY_ROAD_2

	db $1 ; signs
	sign $3, $21, $8 ; Route23Text8

	db $7 ; objects
	object SPRITE_GUARD, $4, $23, STAY, DOWN, $1 ; person
	object SPRITE_GUARD, $a, $38, STAY, DOWN, $2 ; person
	object SPRITE_SWIMMER, $8, $55, STAY, DOWN, $3 ; person
	object SPRITE_SWIMMER, $b, $60, STAY, DOWN, $4 ; person
	object SPRITE_GUARD, $c, $69, STAY, DOWN, $5 ; person
	object SPRITE_GUARD, $8, $77, STAY, DOWN, $6 ; person
	object SPRITE_GUARD, $8, $88, STAY, DOWN, $7 ; person

	; warp-to
	warp_to $7, $8b, ROUTE_23_WIDTH ; ROUTE_22_GATE
	warp_to $8, $8b, ROUTE_23_WIDTH ; ROUTE_22_GATE
	warp_to $4, $1f, ROUTE_23_WIDTH ; VICTORY_ROAD_1
	warp_to $e, $1f, ROUTE_23_WIDTH ; VICTORY_ROAD_2
