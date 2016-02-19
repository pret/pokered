Route25Mons:
	db $0F
	IF DEF(_RED)
		dbw 8,WEEDLE
		dbw 9,KAKUNA
		dbw 13,PIDGEY
		dbw 12,ODDISH
		dbw 13,ODDISH
		dbw 12,ABRA
		dbw 14,ODDISH
		dbw 10,ABRA
		dbw 7,METAPOD
		dbw 8,CATERPIE
	ENDC
	IF DEF(_BLUE)
		dbw 8,CATERPIE
		dbw 9,METAPOD
		dbw 13,PIDGEY
		dbw 12,BELLSPROUT
		dbw 13,BELLSPROUT
		dbw 12,ABRA
		dbw 14,BELLSPROUT
		dbw 10,ABRA
		dbw 7,KAKUNA
		dbw 8,WEEDLE
	ENDC
	db $00
