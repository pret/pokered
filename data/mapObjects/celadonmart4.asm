CeladonMart4Object:
	db $f ; border block

	db $3 ; warps
	db $1, $c, $0, CELADON_MART_3
	db $1, $10, $1, CELADON_MART_5
	db $1, $1, $0, CELADON_MART_ELEVATOR

	db $1 ; signs
	db $1, $e, $4 ; CeladonMart4Text4

	db $3 ; objects
	object SPRITE_MART_GUY, $5, $7, STAY, NONE, $1 ; person
	object SPRITE_BLACK_HAIR_BOY_2, $f, $5, WALK, $2, $2 ; person
	object SPRITE_BUG_CATCHER, $5, $2, WALK, $2, $3 ; person

	; warp-to
	EVENT_DISP CELADON_MART_4_WIDTH, $1, $c ; CELADON_MART_3
	EVENT_DISP CELADON_MART_4_WIDTH, $1, $10 ; CELADON_MART_5
	EVENT_DISP CELADON_MART_4_WIDTH, $1, $1 ; CELADON_MART_ELEVATOR
