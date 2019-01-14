PokemonTower3F_h:
	db CEMETERY ; tileset
	db POKEMON_TOWER_3F_HEIGHT, POKEMON_TOWER_3F_WIDTH ; dimensions (y, x)
	dw PokemonTower3F_Blocks ; blocks
	dw PokemonTower3F_TextPointers ; texts
	dw PokemonTower3F_Script ; scripts
	db 0 ; connections
	dw PokemonTower3F_Object ; objects
