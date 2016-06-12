CopycatsHouse1F_h:
	db REDS_HOUSE_1 ; tileset
	db COPYCATS_HOUSE_1F_HEIGHT, COPYCATS_HOUSE_1F_WIDTH ; dimensions (y, x)
	dw CopycatsHouse1FBlocks, CopycatsHouse1FTextPointers, CopycatsHouse1FScript ; blocks, texts, scripts
	db $00 ; connections
	dw CopycatsHouse1FObject ; objects
