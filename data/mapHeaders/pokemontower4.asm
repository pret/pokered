PokemonTower4_h:
	db CEMETERY ; tileset
	db POKEMONTOWER_4_HEIGHT, POKEMONTOWER_4_WIDTH ; dimensions (y, x)
	dw PokemonTower4Blocks, PokemonTower4TextPointers, PokemonTower4Script ; blocks, texts, scripts
	db 0 ; connections
	dw PokemonTower4Object ; objects
