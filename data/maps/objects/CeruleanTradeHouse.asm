CeruleanTradeHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 1, -1
	warp 3, 7, 1, -1

	db 0 ; signs

	db 2 ; objects
	object SPRITE_OLD_MEDIUM_WOMAN, 5, 4, STAY, LEFT, 1 ; person
	object SPRITE_GAMBLER, 1, 2, STAY, NONE, 2 ; person

	; warp-to
	warp_to 2, 7, CERULEAN_TRADE_HOUSE_WIDTH
	warp_to 3, 7, CERULEAN_TRADE_HOUSE_WIDTH
