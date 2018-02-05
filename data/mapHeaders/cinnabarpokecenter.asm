CinnabarPokecenter_h:
	db POKECENTER ; tileset
	db CINNABAR_POKECENTER_HEIGHT, CINNABAR_POKECENTER_WIDTH ; dimensions (y, x)
	dw CinnabarPokecenterBlocks, CinnabarPokecenterTextPointers, CinnabarPokecenterScript ; blocks, texts, scripts
	db 0 ; connections
	dw CinnabarPokecenterObject ; objects
