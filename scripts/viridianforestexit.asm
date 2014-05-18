ViridianForestExitScript: ; 5d587 (17:5587)
	jp EnableAutoTextBoxDrawing

ViridianForestExitTextPointers: ; 5d58a (17:558a)
	dw ViridianForestExitText1
	dw ViridianForestExitText2

ViridianForestExitText1: ; 5d58e (17:558e)
	TX_FAR _ViridianForestExitText1
	db "@"

ViridianForestExitText2: ; 5d593 (17:5593)
	TX_FAR _ViridianForestExitText2
	db "@"
