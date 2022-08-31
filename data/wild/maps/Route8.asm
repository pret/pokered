Route8WildMons:
	def_grass_wildmons 15 ; encounter rate
	db 20, PIDGEOTTO
IF DEF(_RED)
	db 18, MANKEY
	db 17, EKANS
	db 16, GROWLITHE
	db 18, BULBASAUR
	db 20, SANDSHREW
	db 19, EKANS
	db 17, VULPIX
	db 18, VULPIX
	db 15, KADABRA
ENDC
IF DEF(_BLUE)
	db 18, MEOWTH
	db 17, SANDSHREW
	db 16, VULPIX
	db 18, BULBASAUR
	db 20, EKANS
	db 19, MANKEY
	db 17, GROWLITHE
	db 18, GROWLITHE
	db 15, KADABRA
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
