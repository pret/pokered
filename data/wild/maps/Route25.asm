Route25WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED)
	db 14, BEEDRILL
	db 13, ODDISH
	db 13, PIDGEY
	db 12, ODDISH
	db 13, PARAS
	db 12, ABRA
	db 14, BELLSPROUT
	db 10, ABRA
	db 10, SKIMPER
	db 15, BUTTERFREE
ENDC
IF DEF(_BLUE)
	db 14, BUTTERFREE
	db 13, BELLSPROUT
	db 13, PIDGEY
	db 12, BELLSPROUT
	db 13, PARAS
	db 12, ABRA
	db 14, ODDISH
	db 10, ABRA
	db 10, SKIMPER
	db 15, BEEDRILL
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
