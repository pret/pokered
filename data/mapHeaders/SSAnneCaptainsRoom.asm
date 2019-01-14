SSAnneCaptainsRoom_h:
	db SHIP ; tileset
	db SS_ANNE_CAPTAINS_ROOM_HEIGHT, SS_ANNE_CAPTAINS_ROOM_WIDTH ; dimensions (y, x)
	dw SSAnneCaptainsRoom_Blocks ; blocks
	dw SSAnneCaptainsRoom_TextPointers ; texts
	dw SSAnneCaptainsRoom_Script ; scripts
	db 0 ; connections
	dw SSAnneCaptainsRoom_Object ; objects
