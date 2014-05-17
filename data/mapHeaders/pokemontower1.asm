PokemonTower1_h: ; 0x60420 to 0x6042c (12 bytes) (id=142)
	db CEMETERY ; tileset
	db POKEMONTOWER_1_HEIGHT, POKEMONTOWER_1_WIDTH ; dimensions (y, x)
	dw PokemonTower1Blocks, PokemonTower1TextPointers, PokemonTower1Script ; blocks, texts, scripts
	db $00 ; connections
	dw PokemonTower1Object ; objects
