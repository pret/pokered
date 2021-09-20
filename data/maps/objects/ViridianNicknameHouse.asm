ViridianNicknameHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 3, LAST_MAP
	warp_event  3,  7, 3, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_BALDING_GUY, 5, 3, STAY, NONE, 1 ; person
	object_event SPRITE_LITTLE_GIRL, 1, 4, WALK, UP_DOWN, 2 ; person
	object_event SPRITE_BIRD, 5, 5, WALK, LEFT_RIGHT, 3 ; person
	object_event SPRITE_CLIPBOARD, 4, 0, STAY, NONE, 4 ; person

	def_warps_to VIRIDIAN_NICKNAME_HOUSE
