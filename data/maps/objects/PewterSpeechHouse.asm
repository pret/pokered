PewterSpeechHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 5, -1
	warp 3, 7, 5, -1

	db 0 ; signs

	db 2 ; objects
	object SPRITE_GAMBLER, 2, 3, STAY, RIGHT, 1 ; person
	object SPRITE_BUG_CATCHER, 4, 5, STAY, NONE, 2 ; person

	; warp-to
	warp_to 2, 7, PEWTER_SPEECH_HOUSE_WIDTH
	warp_to 3, 7, PEWTER_SPEECH_HOUSE_WIDTH
