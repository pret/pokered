Route2WildMons:
	def_grass_wildmons 25 ; encounter rate
	db  4, RATTATA
	db  5, PIDGEY
	db  4, PIDGEY
	db  4, RATTATA
	db  5, MONJA
IF DEF(_RED)
	db  4, WEEDLE
	db  3, RATTATA
	db  5, RATTATA
	db  5, WEEDLE
	db  6, WEEDLE
ENDC
IF DEF(_BLUE)
	db  4, CATERPIE
	db  3, RATTATA
	db  5, RATTATA
	db  5, CATERPIE
	db  6, CATERPIE
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
