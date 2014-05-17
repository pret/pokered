SeafoamIslands4_h: ; 0x46581 to 0x4658d (12 bytes) (bank=11) (id=161)
	db CAVERN ; tileset
	db SEAFOAM_ISLANDS_4_HEIGHT, SEAFOAM_ISLANDS_4_WIDTH ; dimensions (y, x)
	dw SeafoamIslands4Blocks, SeafoamIslands4TextPointers, SeafoamIslands4Script ; blocks, texts, scripts
	db $00 ; connections
	dw SeafoamIslands4Object ; objects
