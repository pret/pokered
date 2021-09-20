FuchsiaMeetingRoom_Object:
	db $17 ; border block

	def_warp_events
	warp_event  4,  7, 6, LAST_MAP
	warp_event  5,  7, 6, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_SAFARI_ZONE_WORKER, 4, 1, STAY, DOWN, 1 ; person
	object_event SPRITE_SAFARI_ZONE_WORKER, 0, 2, STAY, UP, 2 ; person
	object_event SPRITE_SAFARI_ZONE_WORKER, 10, 1, STAY, DOWN, 3 ; person

	def_warps_to FUCHSIA_MEETING_ROOM
