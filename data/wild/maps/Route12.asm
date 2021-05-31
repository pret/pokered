Route12WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db 24, ODDISH
	db 25, PIDGEY
	db 23, PIDGEY
	db 24, VENONAT
	db 22, ODDISH
	db 26, VENONAT
	db 26, ODDISH
	db 27, PIDGEY
	db 28, GLOOM
	db 30, GLOOM
ENDC
IF DEF(_BLUE)
	db 24, BELLSPROUT
	db 25, PIDGEY
	db 23, PIDGEY
	db 24, VENONAT
	db 22, BELLSPROUT
	db 26, VENONAT
	db 26, BELLSPROUT
	db 27, PIDGEY
	db 28, WEEPINBELL
	db 30, WEEPINBELL
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
