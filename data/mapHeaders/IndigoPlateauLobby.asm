IndigoPlateauLobby_h:
	db MART ; tileset
	db INDIGO_PLATEAU_LOBBY_HEIGHT, INDIGO_PLATEAU_LOBBY_WIDTH ; dimensions (y, x)
	dw IndigoPlateauLobby_Blocks ; blocks
	dw IndigoPlateauLobby_TextPointers ; texts
	dw IndigoPlateauLobby_Script ; scripts
	db 0 ; connections
	dw IndigoPlateauLobby_Object ; objects
