Route15GateScript: ; 49602 (12:5602)
	jp EnableAutoTextBoxDrawing

Route15GateTextPointers: ; 49605 (12:5605)
	dw Route15GateText1

Route15GateText1: ; 49607 (12:5607)
	TX_FAR _Route15GateText1
	db "@"
