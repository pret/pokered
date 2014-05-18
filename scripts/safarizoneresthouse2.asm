SafariZoneRestHouse2Script: ; 45d2a (11:5d2a)
	call EnableAutoTextBoxDrawing
	ret

SafariZoneRestHouse2TextPointers: ; 45d2e (11:5d2e)
	dw SafariZoneRestHouse2Text1
	dw SafariZoneRestHouse2Text2
	dw SafariZoneRestHouse2Text3

SafariZoneRestHouse2Text1: ; 45d34 (11:5d34)
	TX_FAR _SafariZoneRestHouse2Text1
	db "@"

SafariZoneRestHouse2Text2: ; 45d39 (11:5d39)
	TX_FAR _SafariZoneRestHouse2Text2
	db "@"

SafariZoneRestHouse2Text3: ; 45d3e (11:5d3e)
	TX_FAR _SafariZoneRestHouse2Text3
	db "@"
