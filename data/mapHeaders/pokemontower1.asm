PokemonTower1_h:
	db CEMETERY ; tileset
	db POKEMONTOWER_1_HEIGHT, POKEMONTOWER_1_WIDTH ; dimensions (y, x)
	dw PokemonTower1Blocks, PokemonTower1TextPointers, PokemonTower1Script ; blocks, texts, scripts
	db $00 ; connections
	dw PokemonTower1Object ; objects
