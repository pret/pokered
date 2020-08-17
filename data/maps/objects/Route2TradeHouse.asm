Route2TradeHouse_Object:
	db $a ; border block

	def_warps
	warp 2, 7, 2, LAST_MAP
	warp 3, 7, 2, LAST_MAP

	def_signs

	def_objects
	object SPRITE_SCIENTIST, 2, 4, STAY, RIGHT, 1 ; person
	object SPRITE_GAMEBOY_KID, 4, 1, STAY, DOWN, 2 ; person

	; warp-to
	warp_to 2, 7, ROUTE_2_TRADE_HOUSE_WIDTH
	warp_to 3, 7, ROUTE_2_TRADE_HOUSE_WIDTH
