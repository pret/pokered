SSAnne1F_Script:
	call EnableAutoTextBoxDrawing
	ret

SSAnne1F_TextPointers:
	dw SSAnne1Text1
	dw SSAnne1Text2

SSAnne1Text1:
	text_far _SSAnne1Text1
	text_end

SSAnne1Text2:
	text_far _SSAnne1Text2
	text_end
