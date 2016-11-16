PewterHouse2Object:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $5, $ff
	db $7, $3, $5, $ff

	db $0 ; signs

	db $2 ; objects
	object SPRITE_GAMBLER, $2, $3, STAY, RIGHT, $1 ; person
	object SPRITE_BUG_CATCHER, $4, $5, STAY, NONE, $2 ; person

	; warp-to
	EVENT_DISP PEWTER_HOUSE_2_WIDTH, $7, $2
	EVENT_DISP PEWTER_HOUSE_2_WIDTH, $7, $3
