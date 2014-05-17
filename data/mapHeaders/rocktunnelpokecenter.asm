RockTunnelPokecenter_h: ; 0x493ae to 0x493ba (12 bytes) (id=81)
	db POKECENTER ; tileset
	db ROCK_TUNNEL_POKECENTER_HEIGHT, ROCK_TUNNEL_POKECENTER_WIDTH ; dimensions (y, x)
	dw RockTunnelPokecenterBlocks, RockTunnelPokecenterTextPointers, RockTunnelPokecenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw RockTunnelPokecenterObject ; objects
