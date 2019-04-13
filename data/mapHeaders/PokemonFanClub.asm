PokemonFanClub_h:
	db INTERIOR ; tileset
	db POKEMON_FAN_CLUB_HEIGHT, POKEMON_FAN_CLUB_WIDTH ; dimensions (y, x)
	dw PokemonFanClub_Blocks ; blocks
	dw PokemonFanClub_TextPointers ; texts
	dw PokemonFanClub_Script ; scripts
	db 0 ; connections
	dw PokemonFanClub_Object ; objects
