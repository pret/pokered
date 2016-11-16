PokemonTower6_h:
	db CEMETERY ; tileset
	db POKEMONTOWER_6_HEIGHT, POKEMONTOWER_6_WIDTH ; dimensions (y, x)
	dw PokemonTower6Blocks, PokemonTower6TextPointers, PokemonTower6Script ; blocks, texts, scripts
	db $00 ; connections
	dw PokemonTower6Object ; objects
