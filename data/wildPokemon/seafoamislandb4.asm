IslandMonsB4:
	db $0A
	IF DEF(_RED)
		dbw 31,HORSEA
		dbw 31,SHELLDER
		dbw 33,HORSEA
		dbw 33,SHELLDER
		dbw 29,SLOWPOKE
		dbw 31,SEEL
		dbw 31,SLOWPOKE
		dbw 29,SEEL
		dbw 39,SLOWBRO
		dbw 32,GOLBAT
	ENDC
	IF DEF(_BLUE)
		dbw 31,KRABBY
		dbw 31,STARYU
		dbw 33,KRABBY
		dbw 33,STARYU
		dbw 29,PSYDUCK
		dbw 31,SEEL
		dbw 31,PSYDUCK
		dbw 29,SEEL
		dbw 39,GOLDUCK
		dbw 32,GOLBAT
	ENDC
	db $00
