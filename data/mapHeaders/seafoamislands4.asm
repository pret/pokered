SeafoamIslands4_h:
	db CAVERN ; tileset
	db SEAFOAM_ISLANDS_4_HEIGHT, SEAFOAM_ISLANDS_4_WIDTH ; dimensions (y, x)
	dw SeafoamIslands4Blocks, SeafoamIslands4TextPointers, SeafoamIslands4Script ; blocks, texts, scripts
	db 0 ; connections
	dw SeafoamIslands4Object ; objects
