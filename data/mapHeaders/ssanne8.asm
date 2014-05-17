SSAnne8_h: ; 0x6196a to 0x61976 (12 bytes) (id=102)
	db SHIP ; tileset
	db SS_ANNE_8_HEIGHT, SS_ANNE_8_WIDTH ; dimensions (y, x)
	dw SSAnne8Blocks, SSAnne8TextPointers, SSAnne8Script ; blocks, texts, scripts
	db $00 ; connections
	dw SSAnne8Object ; objects
