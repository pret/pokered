	object_const_def
	const_export GAMECORNERPRIZEROOM_BALDING_GUY
	const_export GAMECORNERPRIZEROOM_GAMBLER

GameCornerPrizeRoom_Object:
	db $f ; border block

	def_warp_events
	warp_event  4,  7, LAST_MAP, 10
	warp_event  5,  7, LAST_MAP, 10

	def_bg_events
	bg_event  2,  2, TEXT_GAMECORNERPRIZEROOM_PRIZE_VENDOR_1
	bg_event  4,  2, TEXT_GAMECORNERPRIZEROOM_PRIZE_VENDOR_2
	bg_event  6,  2, TEXT_GAMECORNERPRIZEROOM_PRIZE_VENDOR_3

	def_object_events
	object_event  1,  4, SPRITE_BALDING_GUY, STAY, NONE, TEXT_GAMECORNERPRIZEROOM_BALDING_GUY
	object_event  7,  3, SPRITE_GAMBLER, WALK, LEFT_RIGHT, TEXT_GAMECORNERPRIZEROOM_GAMBLER

	def_warps_to GAME_CORNER_PRIZE_ROOM
