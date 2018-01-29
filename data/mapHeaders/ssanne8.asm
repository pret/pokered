SSAnne8_h:
	db SHIP ; tileset
	db SS_ANNE_8_HEIGHT, SS_ANNE_8_WIDTH ; dimensions (y, x)
	dw SSAnne8Blocks, SSAnne8TextPointers, SSAnne8Script ; blocks, texts, scripts
	db 0 ; connections
	dw SSAnne8Object ; objects
