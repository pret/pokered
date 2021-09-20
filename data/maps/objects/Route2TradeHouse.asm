Route2TradeHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 2, LAST_MAP
	warp_event  3,  7, 2, LAST_MAP

	def_bg_events

	def_objects
	object SPRITE_SCIENTIST, 2, 4, STAY, RIGHT, 1 ; person
	object SPRITE_GAMEBOY_KID, 4, 1, STAY, DOWN, 2 ; person

	def_warps_to ROUTE_2_TRADE_HOUSE
