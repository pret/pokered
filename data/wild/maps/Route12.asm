Route12WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db 24, ODDISH
	db 25, PIDGEOTTO
	db 23, BLASTYKE
	db 24, BELLSPROUT
	db 22, SQUIRTLE
	db 26, BARUNDA
	db 26, WEEPINBELL
	db 27, FARFETCHD
	db 28, GLOOM
	db 30, GLOOM
ENDC
IF DEF(_BLUE)
	db 24, BELLSPROUT
	db 25, PIDGEOTTO
	db 23, BLASTYKE
	db 24, ODDISH
	db 22, SQUIRTLE
	db 26, BARUNDA
	db 26, GLOOM
	db 27, FARFETCHD
	db 28, WEEPINBELL
	db 30, WEEPINBELL
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
