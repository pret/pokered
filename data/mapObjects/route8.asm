Route8Object: ; 0x5814f (size=119)
	db $2c ; border block

	db $5 ; warps
	db $9, $1, $0, ROUTE_8_GATE
	db $a, $1, $1, ROUTE_8_GATE
	db $9, $8, $2, ROUTE_8_GATE
	db $a, $8, $3, ROUTE_8_GATE
	db $3, $d, $0, PATH_ENTRANCE_ROUTE_8

	db $1 ; signs
	db $3, $11, $a ; Route8Text10

	db $9 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $5 + 4, $8 + 4, $ff, $d3, $41, SUPER_NERD + $C8, $3 ; trainer
	db SPRITE_GAMBLER, $9 + 4, $d + 4, $ff, $d1, $42, GAMBLER + $C8, $5 ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $6 + 4, $2a + 4, $ff, $d1, $43, SUPER_NERD + $C8, $4 ; trainer
	db SPRITE_LASS, $3 + 4, $1a + 4, $ff, $d2, $44, LASS + $C8, $d ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $4 + 4, $1a + 4, $ff, $d3, $45, SUPER_NERD + $C8, $5 ; trainer
	db SPRITE_LASS, $5 + 4, $1a + 4, $ff, $d2, $46, LASS + $C8, $e ; trainer
	db SPRITE_LASS, $6 + 4, $1a + 4, $ff, $d3, $47, LASS + $C8, $f ; trainer
	db SPRITE_GAMBLER, $d + 4, $2e + 4, $ff, $d0, $48, GAMBLER + $C8, $7 ; trainer
	db SPRITE_LASS, $c + 4, $33 + 4, $ff, $d2, $49, LASS + $C8, $10 ; trainer

	; warp-to
	EVENT_DISP ROUTE_8_WIDTH, $9, $1 ; ROUTE_8_GATE
	EVENT_DISP ROUTE_8_WIDTH, $a, $1 ; ROUTE_8_GATE
	EVENT_DISP ROUTE_8_WIDTH, $9, $8 ; ROUTE_8_GATE
	EVENT_DISP ROUTE_8_WIDTH, $a, $8 ; ROUTE_8_GATE
	EVENT_DISP ROUTE_8_WIDTH, $3, $d ; PATH_ENTRANCE_ROUTE_8
