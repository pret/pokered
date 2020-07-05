SafariZoneWestRestHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

SafariZoneWestRestHouse_TextPointers:
	dw SafariZoneRestHouse2Text1
	dw SafariZoneRestHouse2Text2
	dw SafariZoneRestHouse2Text3

SafariZoneRestHouse2Text1:
	text_far _SafariZoneRestHouse2Text1
	text_end

SafariZoneRestHouse2Text2:
	text_far _SafariZoneRestHouse2Text2
	text_end

SafariZoneRestHouse2Text3:
	text_far _SafariZoneRestHouse2Text3
	text_end
