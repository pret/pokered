CeladonMansion3_h:
	db MANSION ; tileset
	db CELADON_MANSION_3_HEIGHT, CELADON_MANSION_3_WIDTH ; dimensions (y, x)
	dw CeladonMansion3Blocks, CeladonMansion3TextPointers, CeladonMansion3Script ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMansion3Object ; objects
