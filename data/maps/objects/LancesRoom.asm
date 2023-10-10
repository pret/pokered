	object_const_def
	const_export LANCESROOM_LANCE

LancesRoom_Object:
	db $3 ; border block

	def_warp_events
	warp_event 24, 16, AGATHAS_ROOM, 3
	warp_event  5,  0, CHAMPIONS_ROOM, 1
	warp_event  6,  0, CHAMPIONS_ROOM, 1

	def_bg_events

	def_object_events
	object_event  6,  1, SPRITE_LANCE, STAY, DOWN, TEXT_LANCESROOM_LANCE, OPP_LANCE, 1

	def_warps_to LANCES_ROOM
