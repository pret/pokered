SafariZoneRestHouse3Script: ; 45d75 (11:5d75)
	call EnableAutoTextBoxDrawing
	ret

SafariZoneRestHouse3TextPointers: ; 45d79 (11:5d79)
	dw SafariZoneRestHouse3Text1
	dw SafariZoneRestHouse3Text2
	dw SafariZoneRestHouse3Text3

SafariZoneRestHouse3Text1: ; 45d7f (11:5d7f)
	TX_FAR _SafariZoneRestHouse3Text1
	db "@"

SafariZoneRestHouse3Text2: ; 45d84 (11:5d84)
	TX_FAR _SafariZoneRestHouse3Text2
	db "@"

SafariZoneRestHouse3Text3: ; 45d89 (11:5d89)
	TX_FAR _SafariZoneRestHouse3Text3
	db "@"
