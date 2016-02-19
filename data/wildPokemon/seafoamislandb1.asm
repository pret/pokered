IslandMonsB1:
	db $0A
	IF DEF(_RED)
		dbw 30,STARYU
		dbw 30,HORSEA
		dbw 32,SHELLDER
		dbw 32,HORSEA
		dbw 28,SLOWPOKE
		dbw 30,SEEL
		dbw 30,SLOWPOKE
		dbw 28,SEEL
		dbw 38,DEWGONG
		dbw 37,SEADRA
	ENDC
	IF DEF(_BLUE)
		dbw 30,SHELLDER
		dbw 30,KRABBY
		dbw 32,STARYU
		dbw 32,KRABBY
		dbw 28,PSYDUCK
		dbw 30,SEEL
		dbw 30,PSYDUCK
		dbw 28,SEEL
		dbw 38,DEWGONG
		dbw 37,KINGLER
	ENDC
	db $00
