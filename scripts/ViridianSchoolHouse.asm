ViridianSchoolHouse_Script:
	jp EnableAutoTextBoxDrawing

ViridianSchoolHouse_TextPointers:
	dw SchoolText1
	dw SchoolText2

SchoolText1:
	TX_FAR _SchoolText1
	db "@"

SchoolText2:
	TX_FAR _SchoolText2
	db "@"
