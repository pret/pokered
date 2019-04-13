SeafoamIslands3_h:
	db CAVERN ; tileset
	db SEAFOAM_ISLANDS_3_HEIGHT, SEAFOAM_ISLANDS_3_WIDTH ; dimensions (y, x)
	dw SeafoamIslands3Blocks, SeafoamIslands3TextPointers, SeafoamIslands3Script ; blocks, texts, scripts
	db 0 ; connections
	dw SeafoamIslands3Object ; objects
