SafariZoneEastRestHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

SafariZoneEastRestHouse_TextPointers:
	dw SafariZoneRestHouse3Text1
	dw SafariZoneRestHouse3Text2
	dw SafariZoneRestHouse3Text3

SafariZoneRestHouse3Text1:
	TX_FAR _SafariZoneRestHouse3Text1
	db "@"

SafariZoneRestHouse3Text2:
	TX_FAR _SafariZoneRestHouse3Text2
	db "@"

SafariZoneRestHouse3Text3:
	TX_FAR _SafariZoneRestHouse3Text3
	db "@"
