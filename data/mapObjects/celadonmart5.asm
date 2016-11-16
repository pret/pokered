CeladonMart5Object:
	db $f ; border block

	db $3 ; warps
	db $1, $c, $0, CELADON_MART_ROOF
	db $1, $10, $1, CELADON_MART_4
	db $1, $1, $0, CELADON_MART_ELEVATOR

	db $1 ; signs
	db $1, $e, $5 ; CeladonMart5Text5

	db $4 ; objects
	object SPRITE_GENTLEMAN, $e, $5, WALK, $1, $1 ; person
	object SPRITE_SAILOR, $2, $6, STAY, NONE, $2 ; person
	object SPRITE_MART_GUY, $5, $3, STAY, DOWN, $3 ; person
	object SPRITE_MART_GUY, $6, $3, STAY, DOWN, $4 ; person

	; warp-to
	EVENT_DISP CELADON_MART_5_WIDTH, $1, $c ; CELADON_MART_ROOF
	EVENT_DISP CELADON_MART_5_WIDTH, $1, $10 ; CELADON_MART_4
	EVENT_DISP CELADON_MART_5_WIDTH, $1, $1 ; CELADON_MART_ELEVATOR
