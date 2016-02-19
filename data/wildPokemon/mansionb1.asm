MansionMonsB1:
	db $0A
	IF DEF(_RED)
		dbw 33,KOFFING
		dbw 31,KOFFING
		dbw 35,GROWLITHE
		dbw 32,PONYTA
		dbw 31,KOFFING
		dbw 40,WEEZING
		dbw 34,PONYTA
		dbw 35,GRIMER
		dbw 42,WEEZING
		dbw 42,MUK
	ENDC
	IF DEF(_BLUE)
		dbw 33,GRIMER
		dbw 31,GRIMER
		dbw 35,VULPIX
		dbw 32,PONYTA
		dbw 31,GRIMER
		dbw 40,MUK
		dbw 34,PONYTA
		dbw 35,KOFFING
		dbw 38,MAGMAR
		dbw 42,WEEZING
	ENDC
	db $00
