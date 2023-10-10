	object_const_def
	const_export CINNABARLABTRADEROOM_SUPER_NERD
	const_export CINNABARLABTRADEROOM_GRAMPS
	const_export CINNABARLABTRADEROOM_BEAUTY

CinnabarLabTradeRoom_Object:
	db $17 ; border block

	def_warp_events
	warp_event  2,  7, CINNABAR_LAB, 3
	warp_event  3,  7, CINNABAR_LAB, 3

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_SUPER_NERD, STAY, DOWN, TEXT_CINNABARLABTRADEROOM_SUPER_NERD
	object_event  1,  4, SPRITE_GRAMPS, STAY, NONE, TEXT_CINNABARLABTRADEROOM_GRAMPS
	object_event  5,  5, SPRITE_BEAUTY, STAY, UP, TEXT_CINNABARLABTRADEROOM_BEAUTY

	def_warps_to CINNABAR_LAB_TRADE_ROOM
