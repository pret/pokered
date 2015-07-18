SafariZoneWestScript: ; 4a1b5 (12:61b5)
	jp EnableAutoTextBoxDrawing

SafariZoneWestTextPointers: ; 4a1b8 (12:61b8)
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw SafariZoneWestText5
	dw SafariZoneWestText6
	dw SafariZoneWestText7
	dw SafariZoneWestText8

SafariZoneWestText5: ; 4a1c8 (12:61c8)
	TX_FAR _SafariZoneWestText5
	db "@"

SafariZoneWestText6: ; 4a1cd (12:61cd)
	TX_FAR _SafariZoneWestText6
	db "@"

SafariZoneWestText7: ; 4a1d2 (12:61d2)
	TX_FAR _SafariZoneWestText7
	db "@"

SafariZoneWestText8: ; 4a1d7 (12:61d7)
	TX_FAR _SafariZoneWestText8
	db "@"
