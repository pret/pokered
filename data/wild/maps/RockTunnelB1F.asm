RockTunnelB1FWildMons:
	def_grass_wildmons 15 ; encounter rate
	db 16, ZUBAT
	db 17, ZUBAT
	db 17, GEODUDE
	db 15, MACHOP
	db 16, GEODUDE
IF DEF(_BLUE)
	db 18, DITTO
ELSE
	db 18, ZUBAT
ENDC
	db 17, MACHOP
	db 17, ONIX
	db 13, ONIX
	db 18, GEODUDE
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
