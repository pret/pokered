VermilionHouse1Object:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $4, $ff
	db $7, $3, $4, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_BUG_CATCHER, $5, $3, STAY, LEFT, $1 ; person
	object SPRITE_BIRD, $3, $5, WALK, $2, $2 ; person
	object SPRITE_PAPER_SHEET, $4, $3, STAY, NONE, $3 ; person

	; warp-to
	EVENT_DISP VERMILION_HOUSE_1_WIDTH, $7, $2
	EVENT_DISP VERMILION_HOUSE_1_WIDTH, $7, $3
