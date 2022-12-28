Route2TradeHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 3
	warp_event  3,  7, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_SCIENTIST, STAY, RIGHT, 1 ; person
	object_event  4,  1, SPRITE_GAMEBOY_KID, STAY, DOWN, 2 ; person

	def_warps_to ROUTE_2_TRADE_HOUSE
