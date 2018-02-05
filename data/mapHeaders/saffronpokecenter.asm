SaffronPokecenter_h:
	db POKECENTER ; tileset
	db SAFFRON_POKECENTER_HEIGHT, SAFFRON_POKECENTER_WIDTH ; dimensions (y, x)
	dw SaffronPokecenterBlocks, SaffronPokecenterTextPointers, SaffronPokecenterScript ; blocks, texts, scripts
	db 0 ; connections
	dw SaffronPokecenterObject ; objects
