Route19Object: ; 0x54e9a (size=87)
	db $43 ; border block

	IF DEF(_OPTION_BEACH_HOUSE)
		db $1 ; warps
		db $9, $5, $0, BEACH_HOUSE
	ELSE
		db $0 ; warps
	ENDC

	db $1 ; signs
IF DEF(_OPTION_BEACH_HOUSE)
	db $b,$b,$b
ELSE
	db $9, $b, $b ; Route19Text11
ENDC

	db $a ; people
IF DEF(_OPTION_BEACH_HOUSE)
	db SPRITE_BLACK_HAIR_BOY_1, $7 + 4, $9 + 4, $ff, $d3, TRAINER | 1, SWIMMER + $C8, 2
	db SPRITE_BLACK_HAIR_BOY_1, $9 + 4, $c + 4, $ff, $d2, TRAINER | 2, SWIMMER + $C8, 3
ELSE
	db SPRITE_BLACK_HAIR_BOY_1, $7 + 4, $8 + 4, $ff, $d2, TRAINER | 1, SWIMMER + $C8, 2
	db SPRITE_BLACK_HAIR_BOY_1, $7 + 4, $d + 4, $ff, $d2, TRAINER | 2, SWIMMER + $C8, 3
ENDC
	db SPRITE_SWIMMER, $19 + 4, $d + 4, $ff, $d2, TRAINER | $3, SWIMMER + $C8, $4
	db SPRITE_SWIMMER, $1b + 4, $4 + 4, $ff, $d3, TRAINER | $4, SWIMMER + $C8, $5
	db SPRITE_SWIMMER, $1f + 4, $10 + 4, $ff, $d1, TRAINER | $5, SWIMMER + $C8, $6
IF DEF(_OPTION_BEACH_HOUSE)
	db SPRITE_SWIMMER, $d + 4, $9 + 4, $ff, $d0, TRAINER | $6, SWIMMER + $C8, $7
ELSE
	db SPRITE_SWIMMER, $b + 4, $9 + 4, $ff, $d0, TRAINER | $6, SWIMMER + $C8, $7
ENDC
	db SPRITE_SWIMMER, $2b + 4, $8 + 4, $ff, $d2, TRAINER | $7, BEAUTY + $C8, $c
	db SPRITE_SWIMMER, $2b + 4, $b + 4, $ff, $d3, TRAINER | $8, BEAUTY + $C8, $d
	db SPRITE_SWIMMER, $2a + 4, $9 + 4, $ff, $d1, TRAINER | $9, SWIMMER + $C8, $8
	db SPRITE_SWIMMER, $2c + 4, $a + 4, $ff, $d0, TRAINER | $a, BEAUTY + $C8, $e

	; warp-to
	IF DEF(_OPTION_BEACH_HOUSE)
		EVENT_DISP ROUTE_19_WIDTH, $9, $5 ; BEACH_HOUSE
	ENDC
