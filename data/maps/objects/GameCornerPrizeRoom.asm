GameCornerPrizeRoom_Object:
	db $f ; border block

	def_warp_events
	warp_event  4,  7, LAST_MAP, 10
	warp_event  5,  7, LAST_MAP, 10

	def_bg_events
	bg_event  2,  2, 3 ; CeladonPrizeRoomText3
	bg_event  4,  2, 4 ; CeladonPrizeRoomText4
	bg_event  6,  2, 5 ; CeladonPrizeRoomText5

	def_object_events
	object_event  1,  4, SPRITE_BALDING_GUY, STAY, NONE, 1 ; person
	object_event  7,  3, SPRITE_GAMBLER, WALK, LEFT_RIGHT, 2 ; person

	def_warps_to GAME_CORNER_PRIZE_ROOM
