PewterSpeechHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 5, LAST_MAP
	warp  3,  7, 5, LAST_MAP

	def_signs

	def_objects
	object SPRITE_GAMBLER, 2, 3, STAY, RIGHT, 1 ; person
	object SPRITE_YOUNGSTER, 4, 5, STAY, NONE, 2 ; person

	def_warps_to PEWTER_SPEECH_HOUSE
