ViridianForestEntranceScript: ; 5d65c (17:565c)
	jp EnableAutoTextBoxDrawing

ViridianForestEntranceTextPointers: ; 5d65f (17:565f)
	dw ViridianForestEntranceText1
	dw ViridianForestEntranceText2

ViridianForestEntranceText1: ; 5d663 (17:5663)
	TX_FAR _ViridianForestEntranceText1
	db "@"

ViridianForestEntranceText2: ; 5d668 (17:5668)
	TX_FAR _ViridianForestEntranceText2
	db "@"
