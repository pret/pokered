PewterSpeechHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 6
	warp_event  3,  7, LAST_MAP, 6

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GAMBLER, STAY, RIGHT, 1 ; person
	object_event  4,  5, SPRITE_YOUNGSTER, STAY, NONE, 2 ; person

	def_warps_to PEWTER_SPEECH_HOUSE
