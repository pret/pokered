Route9WildMons:
	def_grass_wildmons 15 ; encounter rate
	db 16, RATTATA
	db 16, SPEAROW
	db 14, RATTATA
IF DEF(_RED)
	db 11, EKANS
	db 13, CUBONE
	db 15, CACTUS
	db 17, RATICATE
	db 20, FEAROW
	db 13, SANDSHREW
	db 17, SANDSHREW
ENDC
IF DEF(_BLUE)
	db 11, SANDSHREW
	db 13, CUBONE
	db 15, CACTUS
	db 17, RATICATE
	db 20, FEAROW
	db 13, EKANS
	db 17, EKANS
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
