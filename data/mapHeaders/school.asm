School_h: ; 0x1d540 to 0x1d54c (12 bytes) (bank=7) (id=43)
	db HOUSE ; tileset
	db VIRIDIAN_SCHOOL_HEIGHT, VIRIDIAN_SCHOOL_WIDTH ; dimensions (y, x)
	dw SchoolBlocks, SchoolTextPointers, SchoolScript ; blocks, texts, scripts
	db $00 ; connections
	dw SchoolObject ; objects
