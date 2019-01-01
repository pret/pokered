MrFujisHouse_h:
	db HOUSE ; tileset
	db MR_FUJIS_HOUSE_HEIGHT, MR_FUJIS_HOUSE_WIDTH ; dimensions (y, x)
	dw MrFujisHouse_Blocks ; blocks
	dw MrFujisHouse_TextPointers ; texts
	dw MrFujisHouse_Script ; scripts
	db 0 ; connections
	dw MrFujisHouse_Object ; objects
