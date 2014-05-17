Route23Object: ; 0x50361 (size=81)
	db $f ; border block

	db $4 ; warps
	db $8b, $7, $2, ROUTE_22_GATE
	db $8b, $8, $3, ROUTE_22_GATE
	db $1f, $4, $0, VICTORY_ROAD_1
	db $1f, $e, $1, VICTORY_ROAD_2

	db $1 ; signs
	db $21, $3, $8 ; Route23Text8

	db $7 ; people
	db SPRITE_GUARD, $23 + 4, $4 + 4, $ff, $d0, $1 ; person
	db SPRITE_GUARD, $38 + 4, $a + 4, $ff, $d0, $2 ; person
	db SPRITE_SWIMMER, $55 + 4, $8 + 4, $ff, $d0, $3 ; person
	db SPRITE_SWIMMER, $60 + 4, $b + 4, $ff, $d0, $4 ; person
	db SPRITE_GUARD, $69 + 4, $c + 4, $ff, $d0, $5 ; person
	db SPRITE_GUARD, $77 + 4, $8 + 4, $ff, $d0, $6 ; person
	db SPRITE_GUARD, $88 + 4, $8 + 4, $ff, $d0, $7 ; person

	; warp-to
	EVENT_DISP ROUTE_23_WIDTH, $8b, $7 ; ROUTE_22_GATE
	EVENT_DISP ROUTE_23_WIDTH, $8b, $8 ; ROUTE_22_GATE
	EVENT_DISP ROUTE_23_WIDTH, $1f, $4 ; VICTORY_ROAD_1
	EVENT_DISP ROUTE_23_WIDTH, $1f, $e ; VICTORY_ROAD_2
