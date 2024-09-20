DisplayOakLabEmailText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump OakLabEmailText

OakLabEmailText::
	text_far _EmailHereText
	text_far _OakLabEmailText
	text_end
