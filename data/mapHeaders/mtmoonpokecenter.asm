MtMoonPokecenter_h: ; 0x492c3 to 0x492cf (12 bytes) (bank=12) (id=68)
	db POKECENTER ; tileset
	db MT_MOON_POKECENTER_HEIGHT, MT_MOON_POKECENTER_WIDTH ; dimensions (y, x)
	dw MtMoonPokecenterBlocks, MtMoonPokecenterTextPointers, MtMoonPokecenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw MtMoonPokecenterObject ; objects
