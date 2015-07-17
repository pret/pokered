Colosseum_h: ; 0x4fd71 to 0x4fd7d (12 bytes) (id=240)
	db CLUB ; tileset
	db COLOSSEUM_HEIGHT, COLOSSEUM_WIDTH ; dimensions (y, x)
	dw ColosseumBlocks, ColosseumTextPointers, ColosseumScript ; blocks, texts, scripts
	db $00 ; connections
	dw ColosseumObject ; objects
