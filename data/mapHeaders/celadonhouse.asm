CeladonHouse_h:
	db MANSION ; tileset
	db CELADON_HOUSE_HEIGHT, CELADON_HOUSE_WIDTH ; dimensions (y, x)
	dw CeladonHouseBlocks, CeladonHouseTextPointers, CeladonHouseScript ; blocks, texts, scripts
	db 0 ; connections
	dw CeladonHouseObject ; objects
