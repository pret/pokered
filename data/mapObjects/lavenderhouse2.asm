LavenderHouse2Object:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $4, $ff
	db $7, $3, $4, $ff

	db $0 ; signs

	db $2 ; objects
	object SPRITE_SLOWBRO, $3, $5, STAY, UP, $1 ; person
	object SPRITE_BRUNETTE_GIRL, $2, $4, STAY, RIGHT, $2 ; person

	; warp-to
	EVENT_DISP LAVENDER_HOUSE_2_WIDTH, $7, $2
	EVENT_DISP LAVENDER_HOUSE_2_WIDTH, $7, $3
