Route11GateScript: ; 4940c (12:540c)
	jp EnableAutoTextBoxDrawing

Route11GateTextPointers: ; 4940f (12:540f)
	dw Route11GateText1

Route11GateText1: ; 49411 (12:5411)
	TX_FAR _Route11GateText1
	db "@"
