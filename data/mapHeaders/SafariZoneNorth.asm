SafariZoneNorth_h:
	db FOREST ; tileset
	db SAFARI_ZONE_NORTH_HEIGHT, SAFARI_ZONE_NORTH_WIDTH ; dimensions (y, x)
	dw SafariZoneNorth_Blocks ; blocks
	dw SafariZoneNorth_TextPointers ; texts
	dw SafariZoneNorth_Script ; scripts
	db 0 ; connections
	dw SafariZoneNorth_Object ; objects
