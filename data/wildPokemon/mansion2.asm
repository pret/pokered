MansionMons2:
	db $0A
	IF DEF(_RED)
		dbw 32,GROWLITHE
		dbw 34,KOFFING
		dbw 34,KOFFING
		dbw 30,PONYTA
		dbw 30,KOFFING
		dbw 32,PONYTA
		dbw 30,GRIMER
		dbw 28,PONYTA
		dbw 39,WEEZING
		dbw 37,MUK
	ENDC
	IF DEF(_BLUE)
		dbw 32,VULPIX
		dbw 34,GRIMER
		dbw 34,GRIMER
		dbw 30,PONYTA
		dbw 30,GRIMER
		dbw 32,PONYTA
		dbw 30,KOFFING
		dbw 28,PONYTA
		dbw 39,MUK
		dbw 37,WEEZING
	ENDC
	db $00
