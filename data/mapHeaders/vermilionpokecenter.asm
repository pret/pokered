VermilionPokecenter_h: ; 0x5c983 to 0x5c98f (12 bytes) (id=89)
	db POKECENTER ; tileset
	db VERMILION_POKECENTER_HEIGHT, VERMILION_POKECENTER_WIDTH ; dimensions (y, x)
	dw VermilionPokecenterBlocks, VermilionPokecenterTextPointers, VermilionPokecenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw VermilionPokecenterObject ; objects
