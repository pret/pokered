SafariZoneRestHouse4Script: ; 45dc0 (11:5dc0)
	call EnableAutoTextBoxDrawing
	ret

SafariZoneRestHouse4TextPointers: ; 45dc4 (11:5dc4)
	dw SafariZoneRestHouse4Text1
	dw SafariZoneRestHouse4Text2
	dw SafariZoneRestHouse4Text3

SafariZoneRestHouse4Text1: ; 45dca (11:5dca)
	TX_FAR _SafariZoneRestHouse4Text1
	db "@"

SafariZoneRestHouse4Text2: ; 45dcf (11:5dcf)
	TX_FAR _SafariZoneRestHouse4Text2
	db "@"

SafariZoneRestHouse4Text3: ; 45dd4 (11:5dd4)
	TX_FAR _SafariZoneRestHouse4Text3
	db "@"
