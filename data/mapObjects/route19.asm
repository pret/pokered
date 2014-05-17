Route19Object: ; 0x54e9a (size=87)
	db $43 ; border block

	IF _YELLOW
		db $1 ; warps
		db $9, $5, $0, $f8 ; SURF_HOUSE
	ENDC
	IF !_YELLOW
		db $0 ; warps
	ENDC

	db $1 ; signs
	db $9, $b, $b ; Route19Text11

	db $a ; people
	db SPRITE_BLACK_HAIR_BOY_1, $7 + 4, $8 + 4, $ff, $d2, $41, SWIMMER + $C8, $2 ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $7 + 4, $d + 4, $ff, $d2, $42, SWIMMER + $C8, $3 ; trainer
	db SPRITE_SWIMMER, $19 + 4, $d + 4, $ff, $d2, $43, SWIMMER + $C8, $4 ; trainer
	db SPRITE_SWIMMER, $1b + 4, $4 + 4, $ff, $d3, $44, SWIMMER + $C8, $5 ; trainer
	db SPRITE_SWIMMER, $1f + 4, $10 + 4, $ff, $d1, $45, SWIMMER + $C8, $6 ; trainer
	db SPRITE_SWIMMER, $b + 4, $9 + 4, $ff, $d0, $46, SWIMMER + $C8, $7 ; trainer
	db SPRITE_SWIMMER, $2b + 4, $8 + 4, $ff, $d2, $47, BEAUTY + $C8, $c ; trainer
	db SPRITE_SWIMMER, $2b + 4, $b + 4, $ff, $d3, $48, BEAUTY + $C8, $d ; trainer
	db SPRITE_SWIMMER, $2a + 4, $9 + 4, $ff, $d1, $49, SWIMMER + $C8, $8 ; trainer
	db SPRITE_SWIMMER, $2c + 4, $a + 4, $ff, $d0, $4a, BEAUTY + $C8, $e ; trainer

	; warp-to
	IF _YELLOW
		EVENT_DISP ROUTE_19_WIDTH, $9, $5 ; SURF_HOUSE
	ENDC
