SafariZoneNorthRestHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

SafariZoneNorthRestHouse_TextPointers:
	dw SafariZoneRestHouse4Text1
	dw SafariZoneRestHouse4Text2
	dw SafariZoneRestHouse4Text3

SafariZoneRestHouse4Text1:
	TX_FAR _SafariZoneRestHouse4Text1
	db "@"

SafariZoneRestHouse4Text2:
	TX_FAR _SafariZoneRestHouse4Text2
	db "@"

SafariZoneRestHouse4Text3:
	TX_FAR _SafariZoneRestHouse4Text3
	db "@"
