CeladonMart2Object:
	db $f ; border block

	db $3 ; warps
	db $1, $c, $4, CELADON_MART_1
	db $1, $10, $1, CELADON_MART_3
	db $1, $1, $0, CELADON_MART_ELEVATOR

	db $1 ; signs
	db $1, $e, $5 ; CeladonMart2Text5

	db $4 ; objects
	object SPRITE_MART_GUY, $5, $3, STAY, DOWN, $1 ; person
	object SPRITE_MART_GUY, $6, $3, STAY, DOWN, $2 ; person
	object SPRITE_FAT_BALD_GUY, $13, $5, STAY, NONE, $3 ; person
	object SPRITE_GIRL, $e, $4, WALK, $1, $4 ; person

	; warp-to
	EVENT_DISP CELADON_MART_2_WIDTH, $1, $c ; CELADON_MART_1
	EVENT_DISP CELADON_MART_2_WIDTH, $1, $10 ; CELADON_MART_3
	EVENT_DISP CELADON_MART_2_WIDTH, $1, $1 ; CELADON_MART_ELEVATOR
