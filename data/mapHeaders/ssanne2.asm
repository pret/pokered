SSAnne2_h:
	db SHIP ; tileset
	db SS_ANNE_2_HEIGHT, SS_ANNE_2_WIDTH ; dimensions (y, x)
	dw SSAnne2Blocks, SSAnne2TextPointers, SSAnne2Script ; blocks, texts, scripts
	db $00 ; connections
	dw SSAnne2Object ; objects
