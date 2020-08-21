FieldMoveDisplayData:
	; move id, FieldMoveNames index, leftmost tile
	; (leftmost tile = -1 + tile column in which the first
	;  letter of the move's name should be displayed)
	db CUT,        1, $06
	db FLY,        2, $0B
	db ANIM_B4,    3, $0C ; unused
	db SURF,       4, $0C
	db STRENGTH,   5, $0C
	db FLASH,      6, $0C
	db DIG,        7, $09
	db TELEPORT,   8, $0A
	db SOFTBOILED, 9, $0B
	db -1 ; end
