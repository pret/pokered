Route14WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db 26, ODDISH
	db 28, PIDGEOTTO
	db 25, DITTO
	db 26, TANGELA
	db 24, BELLSPROUT
	db 28, VENOMOTH
	db 28, GLOOM
	db 32, WEEPINBELL
	db 30, PIDGEOTTO
	db 32, SCYTHER
ENDC
IF DEF(_BLUE)
	db 26, BELLSPROUT
	db 28, PIDGEOTTO
	db 25, DITTO
	db 26, TANGELA
	db 24, ODDISH
	db 28, VENOMOTH
	db 28, WEEPINBELL
	db 32, GLOOM
	db 30, PIDGEOTTO
	db 32, PINSIR
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
