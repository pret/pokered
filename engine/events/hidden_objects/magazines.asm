PrintMagazinesText:
	call EnableAutoTextBoxDrawing
	tx_pre MagazinesText
	ret

MagazinesText::
	TX_FAR _MagazinesText
	db "@"
