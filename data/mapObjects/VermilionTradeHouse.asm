VermilionTradeHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 7, -1
	warp 3, 7, 7, -1

	db 0 ; signs

	db 1 ; objects
	object SPRITE_LITTLE_GIRL, 3, 5, STAY, UP, 1 ; person

	; warp-to
	warp_to 2, 7, VERMILION_TRADE_HOUSE_WIDTH
	warp_to 3, 7, VERMILION_TRADE_HOUSE_WIDTH
