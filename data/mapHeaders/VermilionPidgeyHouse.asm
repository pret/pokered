VermilionPidgeyHouse_h:
	db HOUSE ; tileset
	db VERMILION_PIDGEY_HOUSE_HEIGHT, VERMILION_PIDGEY_HOUSE_WIDTH ; dimensions (y, x)
	dw VermilionPidgeyHouse_Blocks ; blocks
	dw VermilionPidgeyHouse_TextPointers ; texts
	dw VermilionPidgeyHouse_Script ; scripts
	db 0 ; connections
	dw VermilionPidgeyHouse_Object ; objects
