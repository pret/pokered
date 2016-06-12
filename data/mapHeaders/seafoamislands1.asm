SeafoamIslands1_h:
	db CAVERN ; tileset
	db SEAFOAM_ISLANDS_1_HEIGHT, SEAFOAM_ISLANDS_1_WIDTH ; dimensions (y, x)
	dw SeafoamIslands1Blocks, SeafoamIslands1TextPointers, SeafoamIslands1Script ; blocks, texts, scripts
	db $00 ; connections
	dw SeafoamIslands1Object ; objects
