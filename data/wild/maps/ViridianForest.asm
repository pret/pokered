ViridianForestWildMons:
	def_grass_wildmons 8 ; encounter rate
IF DEF(_RED)
	db  4, WEEDLE
	db  5, KAKUNA
	db  3, WEEDLE
	db  4, KAKUNA
	db  3, CATERPIE
	db  4, METAPOD
	db  3, ODDISH
ENDC
IF DEF(_BLUE)
	db  4, CATERPIE
	db  5, METAPOD
	db  3, CATERPIE
	db  4, METAPOD
	db  3, WEEDLE
	db  4, KAKUNA
	db  3, BELLSPROUT
ENDC
	db  4, VENONAT
	db  3, PARAS
	db  5, PIKACHU
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
