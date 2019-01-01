PokemonTower1F_h:
	db CEMETERY ; tileset
	db POKEMON_TOWER_1F_HEIGHT, POKEMON_TOWER_1F_WIDTH ; dimensions (y, x)
	dw PokemonTower1F_Blocks ; blocks
	dw PokemonTower1F_TextPointers ; texts
	dw PokemonTower1F_Script ; scripts
	db 0 ; connections
	dw PokemonTower1F_Object ; objects
