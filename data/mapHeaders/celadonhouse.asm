CeladonHouse_h: ; 0x49202 to 0x4920e (12 bytes) (bank=12) (id=139)
	db MANSION ; tileset
	db CELADON_HOUSE_HEIGHT, CELADON_HOUSE_WIDTH ; dimensions (y, x)
	dw CeladonHouseBlocks, CeladonHouseTextPointers, CeladonHouseScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonHouseObject ; objects
