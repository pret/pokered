NameRater_h:
	db HOUSE ; tileset
	db NAME_RATERS_HOUSE_HEIGHT, NAME_RATERS_HOUSE_WIDTH ; dimensions (y, x)
	dw NameRaterBlocks, NameRaterTextPointers, NameRaterScript ; blocks, texts, scripts
	db $00 ; connections
	dw NameRaterObject ; objects
