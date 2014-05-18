PewterHouse2Script: ; 1d648 (7:5648)
	jp EnableAutoTextBoxDrawing

PewterHouse2TextPointers: ; 1d64b (7:564b)
	dw PewterHouse2Text1
	dw PewterHouse2Text2

PewterHouse2Text1: ; 1d64f (7:564f)
	TX_FAR _PewterHouse2Text1
	db "@"

PewterHouse2Text2: ; 1d654 (7:5654)
	TX_FAR _PewterHouse2Text2
	db "@"
