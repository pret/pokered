SafariZoneWest_h:
	db FOREST ; tileset
	db SAFARI_ZONE_WEST_HEIGHT, SAFARI_ZONE_WEST_WIDTH ; dimensions (y, x)
	dw SafariZoneWest_Blocks ; blocks
	dw SafariZoneWest_TextPointers ; texts
	dw SafariZoneWest_Script ; scripts
	db 0 ; connections
	dw SafariZoneWest_Object ; objects
