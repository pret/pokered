IF DEF(_RED)
DefaultNamesPlayer:
	db   "NAME"
	next "ROT"
	next "ASH"
	next "JACK"
	db   "@"

DefaultNamesRival:
	db   "NAME"
	next "BLAU"
	next "GARY"
	next "JOHN"
	db   "@"
ENDC

IF DEF(_BLUE)
DefaultNamesPlayer:
	db   "NAME"
	next "BLAU"
	next "GARY"
	next "JOHN"
	db   "@"

DefaultNamesRival:
	db   "NAME"
	next "ROT"
	next "ASH"
	next "JACK"
	db   "@"
ENDC
