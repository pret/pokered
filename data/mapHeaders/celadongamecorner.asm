CeladonGameCorner_h:
	db LOBBY ; tileset
	db GAME_CORNER_HEIGHT, GAME_CORNER_WIDTH ; dimensions (y, x)
	dw CeladonGameCornerBlocks, CeladonGameCornerTextPointers, CeladonGameCornerScript ; blocks, texts, scripts
	db 0 ; connections
	dw CeladonGameCornerObject ; objects
