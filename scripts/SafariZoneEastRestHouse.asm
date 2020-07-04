SafariZoneEastRestHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

SafariZoneEastRestHouse_TextPointers:
	dw SafariZoneRestHouse3Text1
	dw SafariZoneRestHouse3Text2
	dw SafariZoneRestHouse3Text3

SafariZoneRestHouse3Text1:
	text_far _SafariZoneRestHouse3Text1
	text_end

SafariZoneRestHouse3Text2:
	text_far _SafariZoneRestHouse3Text2
	text_end

SafariZoneRestHouse3Text3:
	text_far _SafariZoneRestHouse3Text3
	text_end
