SSAnne10_h: ; 0x61d49 to 0x61d55 (12 bytes) (id=104)
	db SHIP ; tileset
	db SS_ANNE_10_HEIGHT, SS_ANNE_10_WIDTH ; dimensions (y, x)
	dw SSAnne10Blocks, SSAnne10TextPointers, SSAnne10Script ; blocks, texts, scripts
	db $00 ; connections
	dw SSAnne10Object ; objects
