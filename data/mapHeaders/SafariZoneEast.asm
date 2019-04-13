SafariZoneEast_h:
	db FOREST ; tileset
	db SAFARI_ZONE_EAST_HEIGHT, SAFARI_ZONE_EAST_WIDTH ; dimensions (y, x)
	dw SafariZoneEast_Blocks ; blocks
	dw SafariZoneEast_TextPointers ; texts
	dw SafariZoneEast_Script ; scripts
	db 0 ; connections
	dw SafariZoneEast_Object ; objects
