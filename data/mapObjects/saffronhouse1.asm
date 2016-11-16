SaffronHouse1Object:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $3, $ff
	db $7, $3, $3, $ff

	db $0 ; signs

	db $4 ; objects
	object SPRITE_BRUNETTE_GIRL, $2, $3, STAY, RIGHT, $1 ; person
	object SPRITE_BIRD, $0, $4, WALK, $1, $2 ; person
	object SPRITE_BUG_CATCHER, $4, $1, STAY, DOWN, $3 ; person
	object SPRITE_PAPER_SHEET, $3, $3, STAY, NONE, $4 ; person

	; warp-to
	EVENT_DISP SAFFRON_HOUSE_1_WIDTH, $7, $2
	EVENT_DISP SAFFRON_HOUSE_1_WIDTH, $7, $3
