
	ret ; unused

UnusedPredefText::
	db "@"

PrintBookcaseText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump BookcaseText

BookcaseText::
	TX_FAR _BookcaseText
	db "@"
