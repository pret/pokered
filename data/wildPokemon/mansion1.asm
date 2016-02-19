MansionMons1:
	db $0A
	IF DEF(_RED)
		dbw 32,KOFFING
		dbw 30,KOFFING
		dbw 34,PONYTA
		dbw 30,PONYTA
		dbw 34,GROWLITHE
		dbw 32,PONYTA
		dbw 30,GRIMER
		dbw 28,PONYTA
		dbw 37,WEEZING
		dbw 39,MUK
	ENDC
	IF DEF(_BLUE)
		dbw 32,GRIMER
		dbw 30,GRIMER
		dbw 34,PONYTA
		dbw 30,PONYTA
		dbw 34,VULPIX
		dbw 32,PONYTA
		dbw 30,KOFFING
		dbw 28,PONYTA
		dbw 37,MUK
		dbw 39,WEEZING
	ENDC
	db $00
