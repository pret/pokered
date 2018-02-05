CopycatsHouse2F_h:
	db REDS_HOUSE_2 ; tileset
	db COPYCATS_HOUSE_2F_HEIGHT, COPYCATS_HOUSE_2F_WIDTH ; dimensions (y, x)
	dw CopycatsHouse2FBlocks, CopycatsHouse2FTextPointers, CopycatsHouse2FScript ; blocks, texts, scripts
	db 0 ; connections
	dw CopycatsHouse2FObject ; objects
