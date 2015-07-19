VermilionHouse3Object: ; 0x19c25 (size=26)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $7, $ff
	db $7, $3, $7, $ff

	db $0 ; signs

	db $1 ; objects
	object SPRITE_LITTLE_GIRL, $3, $5, STAY, UP, $1 ; person

	; warp-to
	EVENT_DISP VERMILION_HOUSE_3_WIDTH, $7, $2
	EVENT_DISP VERMILION_HOUSE_3_WIDTH, $7, $3
