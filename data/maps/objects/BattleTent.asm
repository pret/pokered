BattleTent_Object: ; 0x1dd9b (size=38)
	db $e ; border block

	def_warp_events
	warp_event  2, 19, CITRINE_CITY, 6
	warp_event  3, 19, CITRINE_CITY, 6

	def_bg_events

	def_object_events
	object_event  2, 14, SPRITE_WAITER, STAY, DOWN, 1 ; person
	object_event  7, 14, SPRITE_CLERK, STAY, DOWN, 2 ; person
	object_event  2,  4, SPRITE_WAITER, STAY, RIGHT, 3 ; person
	object_event 10,  4, SPRITE_YOUNGSTER, STAY, LEFT, 4 ; person
	

	def_warps_to BATTLE_TENT