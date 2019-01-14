PokemonTower6F_h:
	db CEMETERY ; tileset
	db POKEMON_TOWER_6F_HEIGHT, POKEMON_TOWER_6F_WIDTH ; dimensions (y, x)
	dw PokemonTower6F_Blocks ; blocks
	dw PokemonTower6F_TextPointers ; texts
	dw PokemonTower6F_Script ; scripts
	db 0 ; connections
	dw PokemonTower6F_Object ; objects
