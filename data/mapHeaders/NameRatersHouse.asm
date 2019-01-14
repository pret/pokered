NameRatersHouse_h:
	db HOUSE ; tileset
	db NAME_RATERS_HOUSE_HEIGHT, NAME_RATERS_HOUSE_WIDTH ; dimensions (y, x)
	dw NameRatersHouse_Blocks ; blocks
	dw NameRatersHouse_TextPointers ; texts
	dw NameRatersHouse_Script ; scripts
	db 0 ; connections
	dw NameRatersHouse_Object ; objects
