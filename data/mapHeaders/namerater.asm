NameRater_h: ; 0x1da06 to 0x1da12 (12 bytes) (bank=7) (id=229)
	db HOUSE ; tileset
	db NAME_RATERS_HOUSE_HEIGHT, NAME_RATERS_HOUSE_WIDTH ; dimensions (y, x)
	dw NameRaterBlocks, NameRaterTextPointers, NameRaterScript ; blocks, texts, scripts
	db $00 ; connections
	dw NameRaterObject ; objects
