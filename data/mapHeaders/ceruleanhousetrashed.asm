CeruleanHouseTrashed_h:
	db HOUSE ; tileset
	db TRASHED_HOUSE_HEIGHT, TRASHED_HOUSE_WIDTH ; dimensions (y, x)
	dw CeruleanHouseTrashedBlocks, CeruleanHouseTrashedTextPointers, CeruleanHouseTrashedScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeruleanHouseTrashedObject ; objects
