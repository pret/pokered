PrintNewBikeText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump NewBicycleText

NewBicycleText::
	text_far _NewBicycleText
	text_end
