Route24Mons:
	db $19
	IF DEF(_RED)
		dbw 7,WEEDLE
		dbw 8,KAKUNA
		dbw 12,PIDGEY
		dbw 12,ODDISH
		dbw 13,ODDISH
		dbw 10,ABRA
		dbw 14,ODDISH
		dbw 13,PIDGEY
		dbw 8,ABRA
		dbw 12,ABRA
	ENDC
	IF DEF(_BLUE)
		dbw 7,CATERPIE
		dbw 8,METAPOD
		dbw 12,PIDGEY
		dbw 12,BELLSPROUT
		dbw 13,BELLSPROUT
		dbw 10,ABRA
		dbw 14,BELLSPROUT
		dbw 13,PIDGEY
		dbw 8,ABRA
		dbw 12,ABRA
	ENDC
	db $00
