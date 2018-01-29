DayCareMObject:
	db $a ; border block

	db $2 ; warps
	warp $2, $7, $4, $ff
	warp $3, $7, $4, $ff

	db $0 ; signs

	db $1 ; objects
	object SPRITE_GENTLEMAN, $2, $3, STAY, RIGHT, $1 ; person

	; warp-to
	warp_to $2, $7, DAYCAREM_WIDTH
	warp_to $3, $7, DAYCAREM_WIDTH
