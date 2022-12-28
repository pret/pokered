ViridianNicknameHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 4
	warp_event  3,  7, LAST_MAP, 4

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_BALDING_GUY, STAY, NONE, 1 ; person
	object_event  1,  4, SPRITE_LITTLE_GIRL, WALK, UP_DOWN, 2 ; person
	object_event  5,  5, SPRITE_BIRD, WALK, LEFT_RIGHT, 3 ; person
	object_event  4,  0, SPRITE_CLIPBOARD, STAY, NONE, 4 ; person

	def_warps_to VIRIDIAN_NICKNAME_HOUSE
