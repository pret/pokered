IslandMonsB3:
	db $0A
	IF DEF(_RED)
		dbw 31,SLOWPOKE
		dbw 31,SEEL
		dbw 33,SLOWPOKE
		dbw 33,SEEL
		dbw 29,HORSEA
		dbw 31,SHELLDER
		dbw 31,HORSEA
		dbw 29,SHELLDER
		dbw 39,SEADRA
		dbw 37,DEWGONG
	ENDC
	IF DEF(_BLUE)
		dbw 31,PSYDUCK
		dbw 31,SEEL
		dbw 33,PSYDUCK
		dbw 33,SEEL
		dbw 29,KRABBY
		dbw 31,STARYU
		dbw 31,KRABBY
		dbw 29,STARYU
		dbw 39,KINGLER
		dbw 37,DEWGONG
	ENDC
	db $00
