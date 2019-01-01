SafariZoneCenter_Script:
	jp EnableAutoTextBoxDrawing

SafariZoneCenter_TextPointers:
	dw PickUpItemText
	dw SafariZoneCenterText2
	dw SafariZoneCenterText3

SafariZoneCenterText2:
	TX_FAR _SafariZoneCenterText2
	db "@"

SafariZoneCenterText3:
	TX_FAR _SafariZoneCenterText3
	db "@"
