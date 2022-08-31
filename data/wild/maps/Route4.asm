Route4WildMons:
	def_grass_wildmons 20 ; encounter rate
	db 10, RATTATA
	db 10, HINAAZU
	db  8, KONYA
IF DEF(_RED)
	db  6, EKANS
	db  8, SPEAROW
	db 10, EKANS
	db 12, RATTATA
	db 12, PUDI
	db  8, SANDSHREW
	db 12, SANDSHREW
ENDC
IF DEF(_BLUE)
	db  6, SANDSHREW
	db  8, SPEAROW
	db 10, SANDSHREW
	db 12, RATTATA
	db 12, MIKON
	db  8, EKANS
	db 12, EKANS
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
