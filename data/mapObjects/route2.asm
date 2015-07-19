Route2Object: ; 0x54022 (size=72)
	db $f ; border block

	db $6 ; warps
	db $9, $c, $0, DIGLETTS_CAVE_EXIT
	db $b, $3, $1, VIRIDIAN_FOREST_EXIT
	db $13, $f, $0, ROUTE_2_HOUSE
	db $23, $10, $1, ROUTE_2_GATE
	db $27, $f, $2, ROUTE_2_GATE
	db $2b, $3, $2, VIRIDIAN_FOREST_ENTRANCE

	db $2 ; signs
	db $41, $5, $3 ; Route2Text3
	db $b, $b, $4 ; Route2Text4

	db $2 ; objects
	object SPRITE_BALL, $d, $36, STAY, NONE, $1, MOON_STONE
	object SPRITE_BALL, $d, $2d, STAY, NONE, $2, HP_UP

	; warp-to
	EVENT_DISP ROUTE_2_WIDTH, $9, $c ; DIGLETTS_CAVE_EXIT
	EVENT_DISP ROUTE_2_WIDTH, $b, $3 ; VIRIDIAN_FOREST_EXIT
	EVENT_DISP ROUTE_2_WIDTH, $13, $f ; ROUTE_2_HOUSE
	EVENT_DISP ROUTE_2_WIDTH, $23, $10 ; ROUTE_2_GATE
	EVENT_DISP ROUTE_2_WIDTH, $27, $f ; ROUTE_2_GATE
	EVENT_DISP ROUTE_2_WIDTH, $2b, $3 ; VIRIDIAN_FOREST_ENTRANCE

	; unused
	EVENT_DISP $4, $7, $2
	db   $12, $c7, $9, $7
	EVENT_DISP $4, $7, $2
	EVENT_DISP $4, $7, $2
	EVENT_DISP $4, $7, $2
