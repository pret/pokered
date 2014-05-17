CinnabarPokecenter_h: ; 0x75e20 to 0x75e2c (12 bytes) (id=171)
	db POKECENTER ; tileset
	db CINNABAR_POKECENTER_HEIGHT, CINNABAR_POKECENTER_WIDTH ; dimensions (y, x)
	dw CinnabarPokecenterBlocks, CinnabarPokecenterTextPointers, CinnabarPokecenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw CinnabarPokecenterObject ; objects
