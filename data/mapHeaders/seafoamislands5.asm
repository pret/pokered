SeafoamIslands5_h:
	db CAVERN ; tileset
	db SEAFOAM_ISLANDS_5_HEIGHT, SEAFOAM_ISLANDS_5_WIDTH ; dimensions (y, x)
	dw SeafoamIslands5Blocks, SeafoamIslands5TextPointers, SeafoamIslands5Script ; blocks, texts, scripts
	db 0 ; connections
	dw SeafoamIslands5Object ; objects
