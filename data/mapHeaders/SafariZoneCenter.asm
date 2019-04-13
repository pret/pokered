SafariZoneCenter_h:
	db FOREST ; tileset
	db SAFARI_ZONE_CENTER_HEIGHT, SAFARI_ZONE_CENTER_WIDTH ; dimensions (y, x)
	dw SafariZoneCenter_Blocks ; blocks
	dw SafariZoneCenter_TextPointers ; texts
	dw SafariZoneCenter_Script ; scripts
	db 0 ; connections
	dw SafariZoneCenter_Object ; objects
