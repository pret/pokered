FieldMoveDisplayData:
	; move id, FieldMoveNames index, leftmost tile
	; (leftmost tile = -1 + tile column in which the first
	;  letter of the move's name should be displayed)
	db CUT,        1, $0C
	db FLY,        2, $0C
	db SURF,       3, $0C
	db STRENGTH,   4, $0A
	db FLASH,      5, $0C
	db DIG,        6, $0C
	db TELEPORT,   7, $0A
	db SOFTBOILED, 8, $08
	db -1 ; end
