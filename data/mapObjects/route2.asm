Route2Object:
	db $f ; border block

	db $6 ; warps
	warp $c, $9, $0, DIGLETTS_CAVE_EXIT
	warp $3, $b, $1, VIRIDIAN_FOREST_EXIT
	warp $f, $13, $0, ROUTE_2_HOUSE
	warp $10, $23, $1, ROUTE_2_GATE
	warp $f, $27, $2, ROUTE_2_GATE
	warp $3, $2b, $2, VIRIDIAN_FOREST_ENTRANCE

	db $2 ; signs
	sign $5, $41, $3 ; Route2Text3
	sign $b, $b, $4 ; Route2Text4

	db $2 ; objects
	object SPRITE_BALL, $d, $36, STAY, NONE, $1, MOON_STONE
	object SPRITE_BALL, $d, $2d, STAY, NONE, $2, HP_UP

	; warp-to
	warp_to $c, $9, ROUTE_2_WIDTH ; DIGLETTS_CAVE_EXIT
	warp_to $3, $b, ROUTE_2_WIDTH ; VIRIDIAN_FOREST_EXIT
	warp_to $f, $13, ROUTE_2_WIDTH ; ROUTE_2_HOUSE
	warp_to $10, $23, ROUTE_2_WIDTH ; ROUTE_2_GATE
	warp_to $f, $27, ROUTE_2_WIDTH ; ROUTE_2_GATE
	warp_to $3, $2b, ROUTE_2_WIDTH ; VIRIDIAN_FOREST_ENTRANCE

	; unused
	warp_to $2, $7, $4
	db $12, $c7, $9, $7
	warp_to $2, $7, $4
	warp_to $2, $7, $4
	warp_to $2, $7, $4
