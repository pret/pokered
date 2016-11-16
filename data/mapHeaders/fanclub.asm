FanClub_h:
	db INTERIOR ; tileset
	db POKEMON_FAN_CLUB_HEIGHT, POKEMON_FAN_CLUB_WIDTH ; dimensions (y, x)
	dw FanClubBlocks, FanClubTextPointers, FanClubScript ; blocks, texts, scripts
	db $00 ; connections
	dw FanClubObject ; objects
