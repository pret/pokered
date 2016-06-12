SaffronHouse2Object:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $7, $ff
	db $7, $3, $7, $ff

	db $0 ; signs

	db $1 ; objects
	object SPRITE_FISHER, $5, $3, STAY, LEFT, $1 ; person

	; warp-to
	EVENT_DISP SAFFRON_HOUSE_2_WIDTH, $7, $2
	EVENT_DISP SAFFRON_HOUSE_2_WIDTH, $7, $3
