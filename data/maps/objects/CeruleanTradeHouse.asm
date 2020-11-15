CeruleanTradeHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 1, LAST_MAP
	warp  3,  7, 1, LAST_MAP

	def_signs

	def_objects
	object SPRITE_GRANNY, 5, 4, STAY, LEFT, 1 ; person
	object SPRITE_GAMBLER, 1, 2, STAY, NONE, 2 ; person

	def_warps_to CERULEAN_TRADE_HOUSE
