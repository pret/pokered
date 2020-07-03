PrintNewBikeText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump NewBicycleText

NewBicycleText::
	TX_FAR _NewBicycleText
	db "@"
