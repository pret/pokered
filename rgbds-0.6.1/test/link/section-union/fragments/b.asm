
SECTION FRAGMENT "output", ROM0
Y:
	db Y
	db 3

assert WARN, Y == 2
