Agatha_h: ; 0x76421 to 0x7642d (12 bytes) (id=247)
	db CEMETERY ; tileset
	db AGATHAS_ROOM_HEIGHT, AGATHAS_ROOM_WIDTH ; dimensions (y, x)
	dw AgathaBlocks, AgathaTextPointers, AgathaScript ; blocks, texts, scripts
	db $00 ; connections
	dw AgathaObject ; objects
