CeruleanTrashedHouse_h:
	db HOUSE ; tileset
	db CERULEAN_TRASHED_HOUSE_HEIGHT, CERULEAN_TRASHED_HOUSE_WIDTH ; dimensions (y, x)
	dw CeruleanTrashedHouse_Blocks ; blocks
	dw CeruleanTrashedHouse_TextPointers ; texts
	dw CeruleanTrashedHouse_Script ; scripts
	db 0 ; connections
	dw CeruleanTrashedHouse_Object ; objects
