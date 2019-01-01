CinnabarLabFossilRoom_h:
	db LAB ; tileset
	db CINNABAR_LAB_FOSSIL_ROOM_HEIGHT, CINNABAR_LAB_FOSSIL_ROOM_WIDTH ; dimensions (y, x)
	dw CinnabarLabFossilRoom_Blocks ; blocks
	dw CinnabarLabFossilRoom_TextPointers ; texts
	dw CinnabarLabFossilRoom_Script ; scripts
	db 0 ; connections
	dw CinnabarLabFossilRoom_Object ; objects
