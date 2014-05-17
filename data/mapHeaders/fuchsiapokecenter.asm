FuchsiaPokecenter_h: ; 0x75057 to 0x75063 (12 bytes) (id=154)
	db POKECENTER ; tileset
	db FUCHSIA_POKECENTER_HEIGHT, FUCHSIA_POKECENTER_WIDTH ; dimensions (y, x)
	dw FuchsiaPokecenterBlocks, FuchsiaPokecenterTextPointers, FuchsiaPokecenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw FuchsiaPokecenterObject ; objects
