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
	object SPRITE_BLACK_HAIR_BOY_1, $9, $7, STAY, RIGHT, 1, SWIMMER + $C8, 2
	object SPRITE_BLACK_HAIR_BOY_1, $c, $9, STAY, LEFT, 2, SWIMMER + $C8, 3
ELSE
	object SPRITE_BLACK_HAIR_BOY_1, $8, $7, STAY, LEFT, 1, SWIMMER + $C8, 2
	object SPRITE_BLACK_HAIR_BOY_1, $d, $7, STAY, LEFT, 2, SWIMMER + $C8, 3
ENDC
	object SPRITE_SWIMMER, $d, $19, STAY, LEFT, $3, SWIMMER + $C8, $4
	object SPRITE_SWIMMER, $4, $1b, STAY, RIGHT, $4, SWIMMER + $C8, $5
	object SPRITE_SWIMMER, $10, $1f, STAY, UP, $5, SWIMMER + $C8, $6
IF DEF(_OPTION_BEACH_HOUSE)
	object SPRITE_SWIMMER, $9, $d, STAY, DOWN, $6, SWIMMER + $C8, $7
ELSE
	object SPRITE_SWIMMER, $9, $b, STAY, DOWN, $6, SWIMMER + $C8, $7
ENDC
	object SPRITE_SWIMMER, $8, $2b, STAY, LEFT, $7, BEAUTY + $C8, $c
	object SPRITE_SWIMMER, $b, $2b, STAY, RIGHT, $8, BEAUTY + $C8, $d
	object SPRITE_SWIMMER, $9, $2a, STAY, UP, $9, SWIMMER + $C8, $8
	object SPRITE_SWIMMER, $a, $2c, STAY, DOWN, $a, BEAUTY + $C8, $e

	; warp-to
	IF DEF(_OPTION_BEACH_HOUSE)
		EVENT_DISP ROUTE_19_WIDTH, $9, $5 ; BEACH_HOUSE
	ENDC
