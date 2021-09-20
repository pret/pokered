GameCornerPrizeRoom_Object:
	db $f ; border block

	def_warp_events
	warp_event  4,  7, 9, LAST_MAP
	warp_event  5,  7, 9, LAST_MAP

	def_bg_events
	bg_event  2,  2, 3 ; CeladonPrizeRoomText3
	bg_event  4,  2, 4 ; CeladonPrizeRoomText4
	bg_event  6,  2, 5 ; CeladonPrizeRoomText5

	def_object_events
	object_event SPRITE_BALDING_GUY, 1, 4, STAY, NONE, 1 ; person
	object_event SPRITE_GAMBLER, 7, 3, WALK, LEFT_RIGHT, 2 ; person

	def_warps_to GAME_CORNER_PRIZE_ROOM
