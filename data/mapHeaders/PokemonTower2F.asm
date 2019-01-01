PokemonTower2F_h:
	db CEMETERY ; tileset
	db POKEMON_TOWER_2F_HEIGHT, POKEMON_TOWER_2F_WIDTH ; dimensions (y, x)
	dw PokemonTower2F_Blocks ; blocks
	dw PokemonTower2F_TextPointers ; texts
	dw PokemonTower2F_Script ; scripts
	db 0 ; connections
	dw PokemonTower2F_Object ; objects
