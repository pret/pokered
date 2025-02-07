SafariZoneWestWildMons:
	def_grass_wildmons 30 ; encounter rate
IF DEF(_GREEN)
	db 25, NIDORAN_F
	db 26, DODUO
	db 23, VENONAT
	db 24, EXEGGCUTE
	db 33, NIDORINA
	db 26, EXEGGCUTE
	db 25, NIDORAN_M
ELSE
	db 25, NIDORAN_M
	db 26, DODUO
	db 23, VENONAT
	db 24, EXEGGCUTE
	db 33, NIDORINO
	db 26, EXEGGCUTE
	db 25, NIDORAN_F
ENDC

	db 31, VENOMOTH
IF DEF(_BLUE)
	db 26, PINSIR
	db 28, LICKITUNG
ELSE
	db 26, TAUROS
	db 28, KANGASKHAN
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
