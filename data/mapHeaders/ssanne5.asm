SSAnne5_h: ; 0x616a2 to 0x616ae (12 bytes) (id=99)
	db SHIP ; tileset
	db SS_ANNE_5_HEIGHT, SS_ANNE_5_WIDTH ; dimensions (y, x)
	dw SSAnne5Blocks, SSAnne5TextPointers, SSAnne5Script ; blocks, texts, scripts
	db $00 ; connections
	dw SSAnne5Object ; objects
