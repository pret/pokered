ViridianPokecenter_h: ; 0x44251 to 0x4425d (12 bytes) (bank=11) (id=41)
	db POKECENTER ; tileset
	db VIRIDIAN_POKECENTER_HEIGHT, VIRIDIAN_POKECENTER_WIDTH ; dimensions (y, x)
	dw ViridianPokecenterBlocks, ViridianPokecenterTextPointers, ViridianPokeCenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw ViridianPokecenterObject ; objects
