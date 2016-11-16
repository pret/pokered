SSAnne7_h:
	db SHIP ; tileset
	db SS_ANNE_7_HEIGHT, SS_ANNE_7_WIDTH ; dimensions (y, x)
	dw SSAnne7Blocks, SSAnne7TextPointers, SSAnne7Script ; blocks, texts, scripts
	db $00 ; connections
	dw SSAnne7Object ; objects
