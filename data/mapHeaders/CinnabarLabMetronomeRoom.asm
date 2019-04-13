CinnabarLabMetronomeRoom_h:
	db LAB ; tileset
	db CINNABAR_LAB_METRONOME_ROOM_HEIGHT, CINNABAR_LAB_METRONOME_ROOM_WIDTH ; dimensions (y, x)
	dw CinnabarLabMetronomeRoom_Blocks ; blocks
	dw CinnabarLabMetronomeRoom_TextPointers ; texts
	dw CinnabarLabMetronomeRoom_Script ; scripts
	db 0 ; connections
	dw CinnabarLabMetronomeRoom_Object ; objects
