SSAnne1_h: ; 0x61259 to 0x61265 (12 bytes) (id=95)
	db SHIP ; tileset
	db SS_ANNE_1_HEIGHT, SS_ANNE_1_WIDTH ; dimensions (y, x)
	dw SSAnne1Blocks, SSAnne1TextPointers, SSAnne1Script ; blocks, texts, scripts
	db $00 ; connections
	dw SSAnne1Object ; objects
