UndergroundPathRoute8_Script:
	ld a, ROUTE_8
	ld [wLastMap], a
	jp EnableAutoTextBoxDrawing

UndergroundPathRoute8_TextPointers:
	def_text_pointers
	dw_const UndergroundPathRoute8GirlText, TEXT_UNDERGROUNDPATHROUTE8_GIRL

UndergroundPathRoute8GirlText:
	text_far _UndergroundPathRoute8GirlText
	text_end
