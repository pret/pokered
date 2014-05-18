SSAnne1Script: ; 61265 (18:5265)
	call EnableAutoTextBoxDrawing
	ret

SSAnne1TextPointers: ; 61269 (18:5269)
	dw SSAnne1Text1
	dw SSAnne1Text2

SSAnne1Text1: ; 6126d (18:526d)
	TX_FAR _SSAnne1Text1
	db "@"

SSAnne1Text2: ; 61272 (18:5272)
	TX_FAR _SSAnne1Text2
	db "@"
