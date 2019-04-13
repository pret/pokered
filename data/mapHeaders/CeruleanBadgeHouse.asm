CeruleanBadgeHouse_h:
	db SHIP ; tileset
	db CERULEAN_BADGE_HOUSE_HEIGHT, CERULEAN_BADGE_HOUSE_WIDTH ; dimensions (y, x)
	dw CeruleanBadgeHouse_Blocks ; blocks
	dw CeruleanBadgeHouse_TextPointers ; texts
	dw CeruleanBadgeHouse_Script ; scripts
	db 0 ; connections
	dw CeruleanBadgeHouse_Object ; objects
