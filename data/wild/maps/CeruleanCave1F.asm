CeruleanCave1FWildMons:
	def_grass_wildmons 10 ; encounter rate
	db 46, GOLBAT
	db 46, HYPNO
	db 46, MAGNETON
IF DEF(_BLUE)
	db 49, RAPIDASH
ELSE
	db 49, DODRIO
ENDC
	db 49, VENOMOTH
IF DEF(_RED)
	db 52, ARBOK
ELSE
	db 52, SANDSLASH
ENDC
	db 49, KADABRA
	db 52, PARASECT
	db 53, RAICHU
	db 53, DITTO
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
