SaffronPokecenter_h: ; 0x5d529 to 0x5d535 (12 bytes) (id=182)
	db POKECENTER ; tileset
	db SAFFRON_POKECENTER_HEIGHT, SAFFRON_POKECENTER_WIDTH ; dimensions (y, x)
	dw SaffronPokecenterBlocks, SaffronPokecenterTextPointers, SaffronPokecenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw SaffronPokecenterObject ; objects
