RockTunnelPokecenter_h:
	db POKECENTER ; tileset
	db ROCK_TUNNEL_POKECENTER_HEIGHT, ROCK_TUNNEL_POKECENTER_WIDTH ; dimensions (y, x)
	dw RockTunnelPokecenter_Blocks ; blocks
	dw RockTunnelPokecenter_TextPointers ; texts
	dw RockTunnelPokecenter_Script ; scripts
	db 0 ; connections
	dw RockTunnelPokecenter_Object ; objects
