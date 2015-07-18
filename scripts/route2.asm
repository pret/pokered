Route2Script: ; 554e3 (15:54e3)
	jp EnableAutoTextBoxDrawing

Route2TextPointers: ; 554e6 (15:54e6)
	dw PickUpItemText
	dw PickUpItemText
	dw Route2Text3
	dw Route2Text4

Route2Text3: ; 554ee (15:54ee)
	TX_FAR _Route2Text3
	db "@"

Route2Text4: ; 554f3 (15:54f3)
	TX_FAR _Route2Text4
	db "@"
