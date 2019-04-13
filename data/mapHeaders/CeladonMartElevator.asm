CeladonMartElevator_h:
	db LOBBY ; tileset
	db CELADON_MART_ELEVATOR_HEIGHT, CELADON_MART_ELEVATOR_WIDTH ; dimensions (y, x)
	dw CeladonMartElevator_Blocks ; blocks
	dw CeladonMartElevator_TextPointers ; texts
	dw CeladonMartElevator_Script ; scripts
	db 0 ; connections
	dw CeladonMartElevator_Object ; objects
