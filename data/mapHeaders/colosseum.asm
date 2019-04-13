Colosseum_h:
	db CLUB ; tileset
	db COLOSSEUM_HEIGHT, COLOSSEUM_WIDTH ; dimensions (y, x)
	dw ColosseumBlocks, ColosseumTextPointers, ColosseumScript ; blocks, texts, scripts
	db 0 ; connections
	dw ColosseumObject ; objects
