RockTunnel2_h:
	db CAVERN ; tileset
	db ROCK_TUNNEL_2_HEIGHT, ROCK_TUNNEL_2_WIDTH ; dimensions (y, x)
	dw RockTunnel2Blocks, RockTunnel2TextPointers, RockTunnel2Script ; blocks, texts, scripts
	db $00 ; connections
	dw RockTunnel2Object ; objects
