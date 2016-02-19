ForestMons:
	db $08
	IF DEF(_RED)
		dbw 4,WEEDLE
		dbw 5,KAKUNA
		dbw 3,WEEDLE
		dbw 5,WEEDLE
		dbw 4,KAKUNA
		dbw 6,KAKUNA
		dbw 4,METAPOD
		dbw 3,CATERPIE
	ENDC
	IF DEF(_BLUE)
		dbw 4,CATERPIE
		dbw 5,METAPOD
		dbw 3,CATERPIE
		dbw 5,CATERPIE
		dbw 4,METAPOD
		dbw 6,METAPOD
		dbw 4,KAKUNA
		dbw 3,WEEDLE
	ENDC
	dbw 3,PIKACHU
	dbw 5,PIKACHU
	db $00
