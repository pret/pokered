ViridianSchoolHouse_h:
	db HOUSE ; tileset
	db VIRIDIAN_SCHOOL_HOUSE_HEIGHT, VIRIDIAN_SCHOOL_HOUSE_WIDTH ; dimensions (y, x)
	dw ViridianSchoolHouse_Blocks ; blocks
	dw ViridianSchoolHouse_TextPointers ; texts
	dw ViridianSchoolHouse_Script ; scripts
	db 0 ; connections
	dw ViridianSchoolHouse_Object ; objects
