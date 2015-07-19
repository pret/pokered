PewterHouse2Object: ; 0x1d659 (size=32)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $5, $ff
	db $7, $3, $5, $ff

	db $0 ; signs

	db $2 ; objects
	object SPRITE_GAMBLER, $2, $3, FACE, LEFT, $1 ; person
	object SPRITE_BUG_CATCHER, $4, $5, FACE, STAY, $2 ; person

	; warp-to
	EVENT_DISP PEWTER_HOUSE_2_WIDTH, $7, $2
	EVENT_DISP PEWTER_HOUSE_2_WIDTH, $7, $3
