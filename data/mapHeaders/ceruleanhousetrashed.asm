CeruleanHouseTrashed_h: ; 0x1d679 to 0x1d685 (12 bytes) (bank=7) (id=62)
	db HOUSE ; tileset
	db TRASHED_HOUSE_HEIGHT, TRASHED_HOUSE_WIDTH ; dimensions (y, x)
	dw CeruleanHouseTrashedBlocks, CeruleanHouseTrashedTextPointers, CeruleanHouseTrashedScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeruleanHouseTrashedObject ; objects
