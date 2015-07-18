SafariZoneNorthScript: ; 459ab (11:59ab)
	jp EnableAutoTextBoxDrawing

SafariZoneNorthTextPointers: ; 459ae (11:59ae)
	dw PickUpItemText
	dw PickUpItemText
	dw SafariZoneNorthText3
	dw SafariZoneNorthText4
	dw SafariZoneNorthText5
	dw SafariZoneNorthText6
	dw SafariZoneNorthText7

SafariZoneNorthText3: ; 459bc (11:59bc)
	TX_FAR _SafariZoneNorthText3
	db "@"

SafariZoneNorthText4: ; 459c1 (11:59c1)
	TX_FAR _SafariZoneNorthText4
	db "@"

SafariZoneNorthText5: ; 459c6 (11:59c6)
	TX_FAR _SafariZoneNorthText5
	db "@"

SafariZoneNorthText6: ; 459cb (11:59cb)
	TX_FAR _SafariZoneNorthText6
	db "@"

SafariZoneNorthText7: ; 459d0 (11:59d0)
	TX_FAR _SafariZoneNorthText7
	db "@"
