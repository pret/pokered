PokemonTower2_h: ; 0x604e6 to 0x604f2 (12 bytes) (id=143)
	db CEMETERY ; tileset
	db POKEMONTOWER_2_HEIGHT, POKEMONTOWER_2_WIDTH ; dimensions (y, x)
	dw PokemonTower2Blocks, PokemonTower2TextPointers, PokemonTower2Script ; blocks, texts, scripts
	db $00 ; connections
	dw PokemonTower2Object ; objects
