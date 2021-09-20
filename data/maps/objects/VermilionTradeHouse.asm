VermilionTradeHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 7, LAST_MAP
	warp_event  3,  7, 7, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_LITTLE_GIRL, 3, 5, STAY, UP, 1 ; person

	def_warps_to VERMILION_TRADE_HOUSE
