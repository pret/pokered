FanClub_h: ; 0x59b64 to 0x59b70 (12 bytes) (id=90)
	db INTERIOR ; tileset
	db POKEMON_FAN_CLUB_HEIGHT, POKEMON_FAN_CLUB_WIDTH ; dimensions (y, x)
	dw FanClubBlocks, FanClubTextPointers, FanClubScript ; blocks, texts, scripts
	db $00 ; connections
	dw FanClubObject ; objects
