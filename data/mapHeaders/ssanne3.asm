SSAnne3_h: ; 0x44926 to 0x44932 (12 bytes) (bank=11) (id=97)
	db SHIP ; tileset
	db SS_ANNE_3_HEIGHT, SS_ANNE_3_WIDTH ; dimensions (y, x)
	dw SSAnne3Blocks, SSAnne3TextPointers, SSAnne3Script ; blocks, texts, scripts
	db $00 ; connections
	dw SSAnne3Object ; objects
