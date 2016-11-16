MtMoonPokecenter_h:
	db POKECENTER ; tileset
	db MT_MOON_POKECENTER_HEIGHT, MT_MOON_POKECENTER_WIDTH ; dimensions (y, x)
	dw MtMoonPokecenterBlocks, MtMoonPokecenterTextPointers, MtMoonPokecenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw MtMoonPokecenterObject ; objects
