FuchsiaMartScript: ; 1dd88 (7:5d88)
	jp EnableAutoTextBoxDrawing

FuchsiaMartTextPointers: ; 1dd8b (7:5d8b)
	dw FuchsiaMartText1
	dw FuchsiaMartText2
	dw FuchsiaMartText3

FuchsiaMartText2: ; 1dd91 (7:5d91)
	TX_FAR _FuchsiaMartText2
	db "@"

FuchsiaMartText3: ; 1dd96 (7:5d96)
	TX_FAR _FuchsiaMartText3
	db "@"
