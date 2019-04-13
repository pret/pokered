MrPsychicsHouse_h:
	db HOUSE ; tileset
	db MR_PSYCHICS_HOUSE_HEIGHT, MR_PSYCHICS_HOUSE_WIDTH ; dimensions (y, x)
	dw MrPsychicsHouse_Blocks ; blocks
	dw MrPsychicsHouse_TextPointers ; texts
	dw MrPsychicsHouse_Script ; scripts
	db 0 ; connections
	dw MrPsychicsHouse_Object ; objects
