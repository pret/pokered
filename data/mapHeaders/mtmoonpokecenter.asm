MtMoonPokecenter_h:
	db POKECENTER ; tileset
	db MT_MOON_POKECENTER_HEIGHT, MT_MOON_POKECENTER_WIDTH ; dimensions (y, x)
	dw MtMoonPokecenterBlocks, MtMoonPokecenterTextPointers, MtMoonPokecenterScript ; blocks, texts, scripts
	db 0 ; connections
	dw MtMoonPokecenterObject ; objects
