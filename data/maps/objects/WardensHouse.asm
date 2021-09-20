WardensHouse_Object:
	db $17 ; border block

	def_warp_events
	warp_event  4,  7, 3, LAST_MAP
	warp_event  5,  7, 3, LAST_MAP

	def_bg_events
	bg_event  4,  3, 4 ; FuchsiaHouse2Text4
	bg_event  5,  3, 5 ; FuchsiaHouse2Text5

	def_objects
	object SPRITE_WARDEN, 2, 3, STAY, NONE, 1 ; person
	object SPRITE_POKE_BALL, 8, 3, STAY, NONE, 2, RARE_CANDY
	object SPRITE_BOULDER, 8, 4, STAY, BOULDER_MOVEMENT_BYTE_2, 3 ; person

	def_warps_to WARDENS_HOUSE
