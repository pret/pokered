IF DEF(_RED)
DefaultNamesPlayerList:
	db "NEW NAME@"
	db "RED@"
	db "ASH@"
	db "JACK@"

DefaultNamesRivalList:
	db "NEW NAME@"
	db "GREEN@"
	db "GARY@"
	db "JOHN@"
ENDC

IF DEF(_GREEN)
DefaultNamesPlayerList:
	db "NEW NAME@"
	db "GREEN@"
	db "GARY@"
	db "JOHN@"

DefaultNamesRivalList:
	db "NEW NAME@"
	db "RED@"
	db "ASH@"
	db "JACK@"
ENDC

IF DEF(_BLUE)
DefaultNamesPlayerList:
	db "NEW NAME@"
	db "BLUE@"
	db "KAZ@"
	db "JEAN@"

DefaultNamesRivalList:
	db "NEW NAME@"
	db "RED@"
	db "GREEN@"
	db "RITCHIE@"
ENDC
