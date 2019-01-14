SaffronPidgeyHouse_h:
	db HOUSE ; tileset
	db SAFFRON_PIDGEY_HOUSE_HEIGHT, SAFFRON_PIDGEY_HOUSE_WIDTH ; dimensions (y, x)
	dw SaffronPidgeyHouse_Blocks ; blocks
	dw SaffronPidgeyHouse_TextPointers ; texts
	dw SaffronPidgeyHouse_Script ; scripts
	db 0 ; connections
	dw SaffronPidgeyHouse_Object ; objects
