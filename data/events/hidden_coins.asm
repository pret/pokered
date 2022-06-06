MACRO hidden_coin
	db \1, \3, \2
ENDM

HiddenCoinCoords:
	; map id, x, y
	hidden_coin GAME_CORNER,  0,  8
	hidden_coin GAME_CORNER,  1, 16
	hidden_coin GAME_CORNER,  3, 11
	hidden_coin GAME_CORNER,  3, 14
	hidden_coin GAME_CORNER,  4, 12
	hidden_coin GAME_CORNER,  9, 12
	hidden_coin GAME_CORNER,  9, 15
	hidden_coin GAME_CORNER, 16, 14
	hidden_coin GAME_CORNER, 10, 16
	hidden_coin GAME_CORNER, 11,  7
	hidden_coin GAME_CORNER, 15,  8
	hidden_coin GAME_CORNER, 12, 15
	db -1 ; end
