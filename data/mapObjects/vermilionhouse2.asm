VermilionHouse2Object:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $8, $ff
	db $7, $3, $8, $ff

	db $0 ; signs

	db $1 ; objects
	object SPRITE_FISHER, $2, $4, STAY, RIGHT, $1 ; person

	; warp-to
	EVENT_DISP VERMILION_HOUSE_2_WIDTH, $7, $2
	EVENT_DISP VERMILION_HOUSE_2_WIDTH, $7, $3
