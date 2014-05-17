SeafoamIslands2_h: ; 0x46309 to 0x46315 (12 bytes) (bank=11) (id=159)
	db CAVERN ; tileset
	db SEAFOAM_ISLANDS_2_HEIGHT, SEAFOAM_ISLANDS_2_WIDTH ; dimensions (y, x)
	dw SeafoamIslands2Blocks, SeafoamIslands2TextPointers, SeafoamIslands2Script ; blocks, texts, scripts
	db $00 ; connections
	dw SeafoamIslands2Object ; objects
