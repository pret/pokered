FuchsiaPokecenter_h:
	db POKECENTER ; tileset
	db FUCHSIA_POKECENTER_HEIGHT, FUCHSIA_POKECENTER_WIDTH ; dimensions (y, x)
	dw FuchsiaPokecenterBlocks, FuchsiaPokecenterTextPointers, FuchsiaPokecenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw FuchsiaPokecenterObject ; objects
