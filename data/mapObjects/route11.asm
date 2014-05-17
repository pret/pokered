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
	db SPRITE_GAMBLER, $e + 4, $a + 4, $ff, $d0, $41, GAMBLER + $C8, $1 ; trainer
	db SPRITE_GAMBLER, $9 + 4, $1a + 4, $ff, $d0, $42, GAMBLER + $C8, $2 ; trainer
	db SPRITE_BUG_CATCHER, $5 + 4, $d + 4, $ff, $d2, $43, YOUNGSTER + $C8, $9 ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $b + 4, $24 + 4, $ff, $d0, $44, ENGINEER + $C8, $2 ; trainer
	db SPRITE_BUG_CATCHER, $4 + 4, $16 + 4, $ff, $d1, $45, YOUNGSTER + $C8, $a ; trainer
	db SPRITE_GAMBLER, $7 + 4, $2d + 4, $ff, $d0, $46, GAMBLER + $C8, $3 ; trainer
	db SPRITE_GAMBLER, $3 + 4, $21 + 4, $ff, $d1, $47, GAMBLER + $C8, $4 ; trainer
	db SPRITE_BUG_CATCHER, $5 + 4, $2b + 4, $ff, $d3, $48, YOUNGSTER + $C8, $b ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $10 + 4, $2d + 4, $ff, $d2, $49, ENGINEER + $C8, $3 ; trainer
	db SPRITE_BUG_CATCHER, $c + 4, $16 + 4, $ff, $d1, $4a, YOUNGSTER + $C8, $c ; trainer

	; warp-to
	EVENT_DISP ROUTE_11_WIDTH, $8, $31 ; ROUTE_11_GATE_1F
	EVENT_DISP ROUTE_11_WIDTH, $9, $31 ; ROUTE_11_GATE_1F
	EVENT_DISP ROUTE_11_WIDTH, $8, $3a ; ROUTE_11_GATE_1F
	EVENT_DISP ROUTE_11_WIDTH, $9, $3a ; ROUTE_11_GATE_1F
	EVENT_DISP ROUTE_11_WIDTH, $5, $4 ; DIGLETTS_CAVE_ENTRANCE
