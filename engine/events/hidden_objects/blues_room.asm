
	ret ; unused

UnusedPredefText::
	db "@"

PrintBookcaseText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump BookcaseText

BookcaseText::
	text_far _BookcaseText
	text_end
