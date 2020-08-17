FuchsiaMeetingRoom_Object:
	db $17 ; border block

	def_warps
	warp 4, 7, 6, LAST_MAP
	warp 5, 7, 6, LAST_MAP

	def_signs

	def_objects
	object SPRITE_SAFARI_ZONE_WORKER, 4, 1, STAY, DOWN, 1 ; person
	object SPRITE_SAFARI_ZONE_WORKER, 0, 2, STAY, UP, 2 ; person
	object SPRITE_SAFARI_ZONE_WORKER, 10, 1, STAY, DOWN, 3 ; person

	; warp-to
	warp_to 4, 7, FUCHSIA_MEETING_ROOM_WIDTH
	warp_to 5, 7, FUCHSIA_MEETING_ROOM_WIDTH
