RedsHouse1F_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 1
	warp_event  3,  7, LAST_MAP, 1
	warp_event  7,  1, REDS_HOUSE_2F, 1

	def_bg_events
	bg_event  3,  1, 2 ; RedsHouse1FTVText

	def_object_events
	object_event  5,  4, SPRITE_MOM, STAY, LEFT, 1

	def_warps_to REDS_HOUSE_1F
