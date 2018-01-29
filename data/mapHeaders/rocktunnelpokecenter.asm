RockTunnelPokecenter_h:
	db POKECENTER ; tileset
	db ROCK_TUNNEL_POKECENTER_HEIGHT, ROCK_TUNNEL_POKECENTER_WIDTH ; dimensions (y, x)
	dw RockTunnelPokecenterBlocks, RockTunnelPokecenterTextPointers, RockTunnelPokecenterScript ; blocks, texts, scripts
	db 0 ; connections
	dw RockTunnelPokecenterObject ; objects
