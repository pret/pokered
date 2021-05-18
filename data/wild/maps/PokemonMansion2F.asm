PokemonMansion2FWildMons:
	def_grass_wildmons 10 ; encounter rate
IF DEF(_RED)
	db 32, GROWLITHE
	db 34, KOFFING
	db 34, KOFFING
	db 30, PONYTA
	db 30, KOFFING
	db 32, PONYTA
	db 30, GRIMER
	db 28, PONYTA
	db 39, WEEZING
	db 37, MUK
ENDC
IF DEF(_BLUE)
	db 32, VULPIX
	db 34, GRIMER
	db 34, GRIMER
	db 30, PONYTA
	db 30, GRIMER
	db 32, PONYTA
	db 30, KOFFING
	db 28, PONYTA
	db 39, MUK
	db 37, WEEZING
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
