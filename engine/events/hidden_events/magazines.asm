PrintMagazinesText:
	call EnableAutoTextBoxDrawing
	tx_pre MagazinesText
	ret

MagazinesText::
	text_far _MagazinesText
	text_end
