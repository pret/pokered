PokemonTower4_h: ; 0x607ea to 0x607f6 (12 bytes) (id=145)
	db CEMETERY ; tileset
	db POKEMONTOWER_4_HEIGHT, POKEMONTOWER_4_WIDTH ; dimensions (y, x)
	dw PokemonTower4Blocks, PokemonTower4TextPointers, PokemonTower4Script ; blocks, texts, scripts
	db $00 ; connections
	dw PokemonTower4Object ; objects
