PewterSpeechHouse_h:
	db HOUSE ; tileset
	db PEWTER_SPEECH_HOUSE_HEIGHT, PEWTER_SPEECH_HOUSE_WIDTH ; dimensions (y, x)
	dw PewterSpeechHouse_Blocks ; blocks
	dw PewterSpeechHouse_TextPointers ; texts
	dw PewterSpeechHouse_Script ; scripts
	db 0 ; connections
	dw PewterSpeechHouse_Object ; objects
