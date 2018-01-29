PokemonTower5_h:
	db CEMETERY ; tileset
	db POKEMONTOWER_5_HEIGHT, POKEMONTOWER_5_WIDTH ; dimensions (y, x)
	dw PokemonTower5Blocks, PokemonTower5TextPointers, PokemonTower5Script ; blocks, texts, scripts
	db 0 ; connections
	dw PokemonTower5Object ; objects
