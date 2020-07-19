IF DEF(_RED)
DefaultNamesPlayer:
	db   "NEW NAME"
	next "RED"
	next "ASH"
	next "JACK"
	db   "@"

DefaultNamesRival:
	db   "NEW NAME"
	next "BLUE"
	next "GARY"
	next "JOHN"
	db   "@"
ENDC

IF DEF(_BLUE)
DefaultNamesPlayer:
	db   "NEW NAME"
	next "PURPLE"
	next "ASH"
	next "EOJ"
	db   "@"

DefaultNamesRival:
	db   "NEW NAME"
	next "GARY"
	next "RANDAL"
	next "THANOS"
	db   "@"
ENDC
