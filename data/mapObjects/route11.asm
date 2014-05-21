Route11Object: ; 0x584e0 (size=127)
	db $f ; border block

	db $5 ; warps
	db $8, $31, $0, ROUTE_11_GATE_1F
	db $9, $31, $1, ROUTE_11_GATE_1F
	db $8, $3a, $2, ROUTE_11_GATE_1F
	db $9, $3a, $3, ROUTE_11_GATE_1F
	db $5, $4, $0, DIGLETTS_CAVE_ENTRANCE

	db $1 ; signs
	db $5, $1, $b ; Route11Text11

	db $a ; people
	db SPRITE_GAMBLER, $e + 4, $a + 4, $ff, $d0, TRAINER | $1, GAMBLER + $C8, $1
	db SPRITE_GAMBLER, $9 + 4, $1a + 4, $ff, $d0, TRAINER | $2, GAMBLER + $C8, $2
	db SPRITE_BUG_CATCHER, $5 + 4, $d + 4, $ff, $d2, TRAINER | $3, YOUNGSTER + $C8, $9
	db SPRITE_BLACK_HAIR_BOY_2, $b + 4, $24 + 4, $ff, $d0, TRAINER | $4, ENGINEER + $C8, $2
	db SPRITE_BUG_CATCHER, $4 + 4, $16 + 4, $ff, $d1, TRAINER | $5, YOUNGSTER + $C8, $a
	db SPRITE_GAMBLER, $7 + 4, $2d + 4, $ff, $d0, TRAINER | $6, GAMBLER + $C8, $3
	db SPRITE_GAMBLER, $3 + 4, $21 + 4, $ff, $d1, TRAINER | $7, GAMBLER + $C8, $4
	db SPRITE_BUG_CATCHER, $5 + 4, $2b + 4, $ff, $d3, TRAINER | $8, YOUNGSTER + $C8, $b
	db SPRITE_BLACK_HAIR_BOY_2, $10 + 4, $2d + 4, $ff, $d2, TRAINER | $9, ENGINEER + $C8, $3
	db SPRITE_BUG_CATCHER, $c + 4, $16 + 4, $ff, $d1, TRAINER | $a, YOUNGSTER + $C8, $c

	; warp-to
	EVENT_DISP ROUTE_11_WIDTH, $8, $31 ; ROUTE_11_GATE_1F
	EVENT_DISP ROUTE_11_WIDTH, $9, $31 ; ROUTE_11_GATE_1F
	EVENT_DISP ROUTE_11_WIDTH, $8, $3a ; ROUTE_11_GATE_1F
	EVENT_DISP ROUTE_11_WIDTH, $9, $3a ; ROUTE_11_GATE_1F
	EVENT_DISP ROUTE_11_WIDTH, $5, $4 ; DIGLETTS_CAVE_ENTRANCE
