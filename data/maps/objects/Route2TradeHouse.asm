	object_const_def
	const_export ROUTE2TRADEHOUSE_SCIENTIST
	const_export ROUTE2TRADEHOUSE_GAMEBOY_KID

Route2TradeHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 3
	warp_event  3,  7, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_SCIENTIST, STAY, RIGHT, TEXT_ROUTE2TRADEHOUSE_SCIENTIST
	object_event  4,  1, SPRITE_GAMEBOY_KID, STAY, DOWN, TEXT_ROUTE2TRADEHOUSE_GAMEBOY_KID

	def_warps_to ROUTE_2_TRADE_HOUSE
