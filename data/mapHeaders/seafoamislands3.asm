SeafoamIslands3_h: ; 0x46445 to 0x46451 (12 bytes) (bank=11) (id=160)
	db CAVERN ; tileset
	db SEAFOAM_ISLANDS_3_HEIGHT, SEAFOAM_ISLANDS_3_WIDTH ; dimensions (y, x)
	dw SeafoamIslands3Blocks, SeafoamIslands3TextPointers, SeafoamIslands3Script ; blocks, texts, scripts
	db $00 ; connections
	dw SeafoamIslands3Object ; objects
