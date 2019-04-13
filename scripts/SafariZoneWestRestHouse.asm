SafariZoneWestRestHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

SafariZoneWestRestHouse_TextPointers:
	dw SafariZoneRestHouse2Text1
	dw SafariZoneRestHouse2Text2
	dw SafariZoneRestHouse2Text3

SafariZoneRestHouse2Text1:
	TX_FAR _SafariZoneRestHouse2Text1
	db "@"

SafariZoneRestHouse2Text2:
	TX_FAR _SafariZoneRestHouse2Text2
	db "@"

SafariZoneRestHouse2Text3:
	TX_FAR _SafariZoneRestHouse2Text3
	db "@"
