PokemonTower7_h: ; 0x60cf9 to 0x60d05 (12 bytes) (id=148)
	db CEMETERY ; tileset
	db POKEMONTOWER_7_HEIGHT, POKEMONTOWER_7_WIDTH ; dimensions (y, x)
	dw PokemonTower7Blocks, PokemonTower7TextPointers, PokemonTower7Script ; blocks, texts, scripts
	db $00 ; connections
	dw PokemonTower7Object ; objects
