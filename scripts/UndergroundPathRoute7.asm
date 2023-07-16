UndergroundPathRoute7_Script:
	ld a, ROUTE_7
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

UndergroundPathRoute7_TextPointers:
	def_text_pointers
	dw_const UndergroundPathRoute7MiddleAgedManText, TEXT_UNDERGROUNDPATHROUTE7_MIDDLE_AGED_MAN

UndergroundPathRoute7MiddleAgedManText:
	text_far _UndergroundPathRoute7MiddleAgedManText
	text_end
