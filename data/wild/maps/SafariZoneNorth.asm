SafariZoneNorthWildMons:
	def_grass_wildmons 30 ; encounter rate
IF DEF(_GREEN)
	db 22, NIDORAN_F
	db 26, RHYHORN
	db 23, PARAS
	db 25, EXEGGCUTE
	db 30, NIDORINA
	db 27, EXEGGCUTE
	db 30, NIDORINO
ELSE
	db 22, NIDORAN_M
	db 26, RHYHORN
	db 23, PARAS
	db 25, EXEGGCUTE
	db 30, NIDORINO
	db 27, EXEGGCUTE
	db 30, NIDORINA
ENDC
	db 32, VENOMOTH
	db 26, CHANSEY
IF DEF(_BLUE)
	db 28, PINSIR
ELSE
	db 28, TAUROS
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
