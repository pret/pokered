SafariZoneCenterScript: ; 45bb2 (11:5bb2)
	jp EnableAutoTextBoxDrawing

SafariZoneCenterTextPointers: ; 45bb5 (11:5bb5)
	dw PickUpItemText
	dw SafariZoneCenterText2
	dw SafariZoneCenterText3

SafariZoneCenterText2: ; 45bbb (11:5bbb)
	TX_FAR _SafariZoneCenterText2
	db "@"

SafariZoneCenterText3: ; 45bc0 (11:5bc0)
	TX_FAR _SafariZoneCenterText3
	db "@"
