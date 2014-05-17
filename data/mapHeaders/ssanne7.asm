SSAnne7_h: ; 0x61889 to 0x61895 (12 bytes) (id=101)
	db SHIP ; tileset
	db SS_ANNE_7_HEIGHT, SS_ANNE_7_WIDTH ; dimensions (y, x)
	dw SSAnne7Blocks, SSAnne7TextPointers, SSAnne7Script ; blocks, texts, scripts
	db $00 ; connections
	dw SSAnne7Object ; objects
