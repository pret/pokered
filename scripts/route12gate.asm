Route12GateScript: ; 49504 (12:5504)
	jp EnableAutoTextBoxDrawing

Route12GateTextPointers: ; 49507 (12:5507)
	dw Route12GateText1

Route12GateText1: ; 49509 (12:5509)
	TX_FAR _Route12GateText1
	db "@"
