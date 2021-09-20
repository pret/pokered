ChampionsRoom_Object:
	db $3 ; border block

	def_warp_events
	warp_event  3,  7, 1, LANCES_ROOM
	warp_event  4,  7, 2, LANCES_ROOM
	warp_event  3,  0, 0, HALL_OF_FAME
	warp_event  4,  0, 0, HALL_OF_FAME

	def_bg_events

	def_object_events
	object_event SPRITE_BLUE, 4, 2, STAY, DOWN, 1 ; person
	object_event SPRITE_OAK, 3, 7, STAY, UP, 2 ; person

	def_warps_to CHAMPIONS_ROOM
