SafariZoneEastScript: ; 4586b (11:586b)
	jp EnableAutoTextBoxDrawing

SafariZoneEastTextPointers: ; 4586e (11:586e)
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw SafariZoneEastText5
	dw SafariZoneEastText6
	dw SafariZoneEastText7

SafariZoneEastText5: ; 4587c (11:587c)
	TX_FAR _SafariZoneEastText5
	db "@"

SafariZoneEastText6: ; 45881 (11:5881)
	TX_FAR _SafariZoneEastText6
	db "@"

SafariZoneEastText7: ; 45886 (11:5886)
	TX_FAR _SafariZoneEastText7
	db "@"
