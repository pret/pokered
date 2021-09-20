PewterSpeechHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 5, LAST_MAP
	warp_event  3,  7, 5, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_GAMBLER, 2, 3, STAY, RIGHT, 1 ; person
	object_event SPRITE_YOUNGSTER, 4, 5, STAY, NONE, 2 ; person

	def_warps_to PEWTER_SPEECH_HOUSE
