IslandMons1:
	db $0F
	IF DEF(_RED)
		dbw 30,SEEL
		dbw 30,SLOWPOKE
		dbw 30,SHELLDER
		dbw 30,HORSEA
		dbw 28,HORSEA
		dbw 21,ZUBAT
		dbw 29,GOLBAT
		dbw 28,PSYDUCK
		dbw 28,SHELLDER
		dbw 38,GOLDUCK
	ENDC
	IF DEF(_BLUE)
		dbw 30,SEEL
		dbw 30,PSYDUCK
		dbw 30,STARYU
		dbw 30,KRABBY
		dbw 28,KRABBY
		dbw 21,ZUBAT
		dbw 29,GOLBAT
		dbw 28,SLOWPOKE
		dbw 28,STARYU
		dbw 38,SLOWBRO
	ENDC
	db $00
