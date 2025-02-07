IF DEF(_RED)
DefaultNamesPlayer:
	db   "NEW NAME"
	next "RED"
	next "ASH"
	next "JACK"
	db   "@"

DefaultNamesRival:
	db   "NEW NAME"
	next "GREEN"
	next "GARY"
	next "JOHN"
	db   "@"
ENDC

IF DEF(_GREEN)
DefaultNamesPlayer:
	db   "NEW NAME"
	next "GREEN"
	next "GARY"
	next "JOHN"
	db   "@"

DefaultNamesRival:
	db   "NEW NAME"
	next "RED"
	next "ASH"
	next "JACK"
	db   "@"
ENDC

IF DEF(_BLUE)
DefaultNamesPlayer:
	db   "NEW NAME"
	next "BLUE"
	next "KAZ"
	next "JEAN"
	db   "@"
	
DefaultNamesRival:
	db   "NEW NAME"
	next "RED"
	next "GREEN"
	next "RITCHIE"
	db   "@"
ENDC
