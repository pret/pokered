Route7WildMons:
	def_grass_wildmons 15 ; encounter rate
	db 19, PIDGEY
IF DEF(_RED)
	db 20, BELLSPROUT
	db 17, MANKEY
	db 22, ODDISH
	db 22, PIDGEY
	db 17, MEOWTH
	db 20, GROWLITHE
	db 20, VULPIX
	db 20, MANKEY
	db 20, MEOWTH
ENDC
IF DEF(_BLUE)
	db 20, BELLSPROUT
	db 17, MANKEY
	db 20, ODDISH
	db 22, PIDGEY
	db 17, MEOWTH
	db 20, GROWLITHE
	db 20, VULPIX
	db 20, MANKEY
	db 20, MEOWTH
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
