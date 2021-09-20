Daycare_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 4, LAST_MAP
	warp_event  3,  7, 4, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_GENTLEMAN, 2, 3, STAY, RIGHT, 1 ; person

	def_warps_to DAYCARE
