SeafoamIslands5_h: ; 0x4678d to 0x46799 (12 bytes) (bank=11) (id=162)
	db CAVERN ; tileset
	db SEAFOAM_ISLANDS_5_HEIGHT, SEAFOAM_ISLANDS_5_WIDTH ; dimensions (y, x)
	dw SeafoamIslands5Blocks, SeafoamIslands5TextPointers, SeafoamIslands5Script ; blocks, texts, scripts
	db $00 ; connections
	dw SeafoamIslands5Object ; objects
