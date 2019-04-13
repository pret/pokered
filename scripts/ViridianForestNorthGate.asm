ViridianForestNorthGate_Script:
	jp EnableAutoTextBoxDrawing

ViridianForestNorthGate_TextPointers:
	dw ViridianForestExitText1
	dw ViridianForestExitText2

ViridianForestExitText1:
	TX_FAR _ViridianForestExitText1
	db "@"

ViridianForestExitText2:
	TX_FAR _ViridianForestExitText2
	db "@"
