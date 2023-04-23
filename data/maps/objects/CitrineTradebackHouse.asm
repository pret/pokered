CitrineTradebackHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 2
	warp_event  3,  7, LAST_MAP, 2

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_GAMBLER, STAY, RIGHT, 1 ; person
	object_event  5,  4, SPRITE_COOLTRAINER_M, STAY, LEFT, 2 ; person
	object_event  4,  3, SPRITE_PAPER, STAY, DOWN, 3 ; person

	def_warps_to CITRINE_TRADEBACK_HOUSE
