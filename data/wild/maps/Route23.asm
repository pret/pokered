Route23WildMons:
	def_grass_wildmons 10 ; encounter rate
IF DEF(_RED)
	db 41, ARBOK
ENDC
IF DEF(_BLUE)
	db 41, SANDSLASH
ENDC
	db 43, ANIMON
	db 38, FEAROW
	db 38, RHYHORN
	db 38, EXEGGCUTE
	db 40, PRIMEAPE
IF DEF(_RED)
	db 41, SCYTHER
ENDC
IF DEF(_BLUE)
	db 41, PINSIR
ENDC
	db 43, EXEGGCUTE
	db 41, ZUDUCK
	db 38, TAUROS
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
