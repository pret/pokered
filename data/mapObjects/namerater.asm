NameRaterObject:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $5, $ff
	db $7, $3, $5, $ff

	db $0 ; signs

	db $1 ; objects
	object SPRITE_MR_MASTERBALL, $5, $3, STAY, LEFT, $1 ; person

	; warp-to
	EVENT_DISP NAME_RATERS_HOUSE_WIDTH, $7, $2
	EVENT_DISP NAME_RATERS_HOUSE_WIDTH, $7, $3
