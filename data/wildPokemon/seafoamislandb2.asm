IslandMonsB2:
	db $0A
	IF DEF(_RED)
		dbw 30,SEEL
		dbw 30,SLOWPOKE
		dbw 32,SEEL
		dbw 32,SLOWPOKE
		dbw 28,HORSEA
		dbw 30,STARYU
		dbw 30,HORSEA
		dbw 28,SHELLDER
		dbw 30,GOLBAT
		dbw 37,SLOWBRO
	ENDC
	IF DEF(_BLUE)
		dbw 30,SEEL
		dbw 30,PSYDUCK
		dbw 32,SEEL
		dbw 32,PSYDUCK
		dbw 28,KRABBY
		dbw 30,SHELLDER
		dbw 30,KRABBY
		dbw 28,STARYU
		dbw 30,GOLBAT
		dbw 37,GOLDUCK
	ENDC
	db $00
