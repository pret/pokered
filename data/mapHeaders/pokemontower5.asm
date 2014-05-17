PokemonTower5_h: ; 0x60926 to 0x60932 (12 bytes) (id=146)
	db CEMETERY ; tileset
	db POKEMONTOWER_5_HEIGHT, POKEMONTOWER_5_WIDTH ; dimensions (y, x)
	dw PokemonTower5Blocks, PokemonTower5TextPointers, PokemonTower5Script ; blocks, texts, scripts
	db $00 ; connections
	dw PokemonTower5Object ; objects
