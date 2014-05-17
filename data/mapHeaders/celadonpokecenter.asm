CeladonPokecenter_h: ; 0x488ac to 0x488b8 (12 bytes) (bank=12) (id=133)
	db POKECENTER ; tileset
	db CELADON_POKECENTER_HEIGHT, CELADON_POKECENTER_WIDTH ; dimensions (y, x)
	dw CeladonPokecenterBlocks, CeladonPokecenterTextPointers, CeladonPokecenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonPokecenterObject ; objects
