CeladonGameCorner_h: ; 0x48bb1 to 0x48bbd (12 bytes) (bank=12) (id=135)
	db LOBBY ; tileset
	db GAME_CORNER_HEIGHT, GAME_CORNER_WIDTH ; dimensions (y, x)
	dw CeladonGameCornerBlocks, CeladonGameCornerTextPointers, CeladonGameCornerScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonGameCornerObject ; objects
