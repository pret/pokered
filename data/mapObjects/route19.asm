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

	db $a ; objects
IF DEF(_OPTION_BEACH_HOUSE)
	object SPRITE_BLACK_HAIR_BOY_1, $9, $7, FACE, LEFT, 1, SWIMMER + $C8, 2
	object SPRITE_BLACK_HAIR_BOY_1, $c, $9, FACE, RIGHT, 2, SWIMMER + $C8, 3
ELSE
	object SPRITE_BLACK_HAIR_BOY_1, $8, $7, FACE, RIGHT, 1, SWIMMER + $C8, 2
	object SPRITE_BLACK_HAIR_BOY_1, $d, $7, FACE, RIGHT, 2, SWIMMER + $C8, 3
ENDC
	object SPRITE_SWIMMER, $d, $19, FACE, RIGHT, $3, SWIMMER + $C8, $4
	object SPRITE_SWIMMER, $4, $1b, FACE, LEFT, $4, SWIMMER + $C8, $5
	object SPRITE_SWIMMER, $10, $1f, FACE, UP, $5, SWIMMER + $C8, $6
IF DEF(_OPTION_BEACH_HOUSE)
	object SPRITE_SWIMMER, $9, $d, FACE, DOWN, $6, SWIMMER + $C8, $7
ELSE
	object SPRITE_SWIMMER, $9, $b, FACE, DOWN, $6, SWIMMER + $C8, $7
ENDC
	object SPRITE_SWIMMER, $8, $2b, FACE, RIGHT, $7, BEAUTY + $C8, $c
	object SPRITE_SWIMMER, $b, $2b, FACE, LEFT, $8, BEAUTY + $C8, $d
	object SPRITE_SWIMMER, $9, $2a, FACE, UP, $9, SWIMMER + $C8, $8
	object SPRITE_SWIMMER, $a, $2c, FACE, DOWN, $a, BEAUTY + $C8, $e

	; warp-to
	IF DEF(_OPTION_BEACH_HOUSE)
		EVENT_DISP ROUTE_19_WIDTH, $9, $5 ; BEACH_HOUSE
	ENDC
