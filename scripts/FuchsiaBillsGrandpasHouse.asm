FuchsiaBillsGrandpasHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

FuchsiaBillsGrandpasHouse_TextPointers:
	dw FuchsiaHouse1Text1
	dw FuchsiaHouse1Text2
	dw FuchsiaHouse1Text3

FuchsiaHouse1Text1:
	text_far _FuchsiaHouse1Text1
	text_end

FuchsiaHouse1Text2:
	text_far _FuchsiaHouse1Text2
	text_end

FuchsiaHouse1Text3:
	text_far _FuchsiaHouse1Text3
	text_end
