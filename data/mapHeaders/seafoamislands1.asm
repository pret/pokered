SeafoamIslands1_h: ; 0x447dd to 0x447e9 (12 bytes) (bank=11) (id=192)
	db CAVERN ; tileset
	db SEAFOAM_ISLANDS_1_HEIGHT, SEAFOAM_ISLANDS_1_WIDTH ; dimensions (y, x)
	dw SeafoamIslands1Blocks, SeafoamIslands1TextPointers, SeafoamIslands1Script ; blocks, texts, scripts
	db $00 ; connections
	dw SeafoamIslands1Object ; objects
