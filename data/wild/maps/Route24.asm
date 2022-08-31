Route24WildMons:
	def_grass_wildmons 25 ; encounter rate
IF DEF(_RED)
	db 13, BEEDRILL
	db 12, ODDISH
	db 12, PIDGEY
	db 12, ODDISH
	db 13, ODDISH
	db 10, ABRA
	db 14, BELLSPROUT
ENDC
IF DEF(_BLUE)
	db 13, BUTTERFREE
	db 12, BELLSPROUT
	db 12, PIDGEY
	db 12, BELLSPROUT
	db 13, BELLSPROUT
	db 10, ABRA
	db 14, ODDISH
ENDC
	db 13, PIDGEY
	db 12, ABRA
	db 16, PIDGEOTTO
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
