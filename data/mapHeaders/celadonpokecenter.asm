CeladonPokecenter_h:
	db POKECENTER ; tileset
	db CELADON_POKECENTER_HEIGHT, CELADON_POKECENTER_WIDTH ; dimensions (y, x)
	dw CeladonPokecenterBlocks, CeladonPokecenterTextPointers, CeladonPokecenterScript ; blocks, texts, scripts
	db 0 ; connections
	dw CeladonPokecenterObject ; objects
