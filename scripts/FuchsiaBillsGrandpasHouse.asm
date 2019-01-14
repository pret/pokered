FuchsiaBillsGrandpasHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

FuchsiaBillsGrandpasHouse_TextPointers:
	dw FuchsiaHouse1Text1
	dw FuchsiaHouse1Text2
	dw FuchsiaHouse1Text3

FuchsiaHouse1Text1:
	TX_FAR _FuchsiaHouse1Text1
	db "@"

FuchsiaHouse1Text2:
	TX_FAR _FuchsiaHouse1Text2
	db "@"

FuchsiaHouse1Text3:
	TX_FAR _FuchsiaHouse1Text3
	db "@"
