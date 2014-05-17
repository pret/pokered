IndigoPlateauLobby_h: ; 0x19c4f to 0x19c5b (12 bytes) (bank=6) (id=174)
	db MART ; tileset
	db INDIGO_PLATEAU_LOBBY_HEIGHT, INDIGO_PLATEAU_LOBBY_WIDTH ; dimensions (y, x)
	dw IndigoPlateauLobbyBlocks, IndigoPlateauLobbyTextPointers, IndigoPlateauLobbyScript ; blocks, texts, scripts
	db $00 ; connections
	dw IndigoPlateauLobbyObject ; objects
