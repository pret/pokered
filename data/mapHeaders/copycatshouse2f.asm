CopycatsHouse2F_h: ; 0x5cc65 to 0x5cc71 (12 bytes) (id=176)
	db REDS_HOUSE_2 ; tileset
	db COPYCATS_HOUSE_2F_HEIGHT, COPYCATS_HOUSE_2F_WIDTH ; dimensions (y, x)
	dw CopycatsHouse2FBlocks, CopycatsHouse2FTextPointers, CopycatsHouse2FScript ; blocks, texts, scripts
	db $00 ; connections
	dw CopycatsHouse2FObject ; objects
