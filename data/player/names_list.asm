; see constants/player_constants.asm

DefaultNamesPlayerList:
	list_start
	li "NEW NAME"
FOR n, 1, NUM_PLAYER_NAMES + 1
	li #PLAYERNAME{d:n}
ENDR
	assert_list_length NUM_PLAYER_NAMES + 1

DefaultNamesRivalList:
	list_start
	li "NEW NAME"
FOR n, 1, NUM_PLAYER_NAMES + 1
	li #RIVALNAME{d:n}
ENDR
	assert_list_length NUM_PLAYER_NAMES + 1
