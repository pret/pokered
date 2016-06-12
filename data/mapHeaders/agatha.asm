Agatha_h:
	db CEMETERY ; tileset
	db AGATHAS_ROOM_HEIGHT, AGATHAS_ROOM_WIDTH ; dimensions (y, x)
	dw AgathaBlocks, AgathaTextPointers, AgathaScript ; blocks, texts, scripts
	db $00 ; connections
	dw AgathaObject ; objects
