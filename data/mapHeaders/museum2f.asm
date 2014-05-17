Museum2F_h: ; 0x5c30b to 0x5c317 (12 bytes) (id=53)
	db MUSEUM ; tileset
	db MUSEUM_2F_HEIGHT, MUSEUM_2F_WIDTH ; dimensions (y, x)
	dw Museum2FBlocks, Museum2FTextPointers, Museum2FScript ; blocks, texts, scripts
	db $00 ; connections
	dw Museum2FObject ; objects
